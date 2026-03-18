% ==========================================
% SLOPE & MASTER DISTANCE
% ==========================================
% 1. Load the Quickmap Slope Data
route_data = readtable('slope_data.csv');

% 2. Extract Distance and Convert to Meters.
% Quickmap exported 'position' in kilometers. Converts to meters
distance_km = route_data.position; 
distance_m = distance_km * 1000;

% 3. Extract Slope and Convert Degrees to Radians
% Quickmap exports 'TerrainSlope' in DEGREES.
slope_degrees = route_data.TerrainSlope;

% Simulink's sin() math blocks expect radians by default.
slope_radians = deg2rad(slope_degrees);

% ==========================================
% TEMPERATURE & ILLUMINATION & HEADING
% ==========================================
% Load the additional Quickmap CSV files
temp_data = readtable('temp_data.csv');
illum_data = readtable('illum_data.csv');

% Extract their distances and convert to meters
temp_dist_m = temp_data.position * 1000;
illum_dist_m = illum_data.position * 1000;

% Extract the raw data variables
raw_temp = temp_data.PolarSummerMaxTemp; 
raw_illum = illum_data.SunVisibility60m;

% Interpolate the data so it aligns with master 'distance_m' array
aligned_temp = interp1(temp_dist_m, raw_temp, distance_m, 'linear', 'extrap');
aligned_illum = interp1(illum_dist_m, raw_illum, distance_m, 'linear', 'extrap');

% --- CALCULATE ROVER HEADING (POLAR CORRECTED) ---
lat = route_data.lat;
lon = route_data.lon;

% 1. Calculate the change in coordinates (in raw degrees)
delta_lat = diff(lat);
delta_lon = diff(lon);

% 2. Prevent glitches if the rover crosses the 180 / -180 longitude meridian
delta_lon(delta_lon > 180) = delta_lon(delta_lon > 180) - 360;
delta_lon(delta_lon < -180) = delta_lon(delta_lon < -180) + 360;

% 3. CONVERT DEGREES TO PHYSICAL METERS!
% On the moon, 1 degree of Latitude is ~30,320 meters everywhere
delta_y_meters = delta_lat * 30320; 

% 1 degree of Longitude shrinks based on the cosine of the latitude
delta_x_meters = delta_lon .* (30320 .* cosd(lat(1:end-1)));

% 4. Calculate the true physical heading using meters, not degrees
heading_rad = atan2(delta_x_meters, delta_y_meters);

% Duplicate the last value so the array length matches your distance array
heading_rad = [heading_rad; heading_rad(end)]; 


% ==========================================
% SEND TO SIMULINK WORKSPACE
% ==========================================
% 4. Send the variables to the Base Workspace for Simulink
assignin('base', 'route_distance', distance_m);
assignin('base', 'route_slope', slope_radians);
assignin('base', 'route_temp', aligned_temp);
assignin('base', 'route_illum', aligned_illum);
assignin('base', 'route_heading', heading_rad);

% Find the total length of route
route_max_dist = max(distance_m);
assignin('base', 'route_max_dist', route_max_dist);

disp('Quickmap Slope, Temp, and Illumination data successfully zipped and loaded!');