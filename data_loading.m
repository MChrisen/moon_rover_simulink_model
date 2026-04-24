% ==========================================
% MASTER ROUTE DATA LOADING
% ==========================================
% 1. Load the unified Quickmap CSV file
route_data = readtable('quickmap_data.csv');

% 2. Extract Distance and Convert to Meters
% Quickmap exports 'position' in kilometers. Converts to meters.
distance_km = route_data.position; 
distance_m = distance_km * 1000;

% 3. Extract Elevation (TerrainHeight)
elevation_m = route_data.TerrainHeight; 

% ==========================================
% TEMPERATURE & ILLUMINATION
% ==========================================

% NOTE: MATLAB's readtable() automatically removes spaces from CSV headers. 
% "Sun Visibility 60m" becomes "SunVisibility60m"
route_temp = route_data.MaximumGlobalTemperatures; 
route_illum = route_data.SunVisibility60m;

% ==========================================
% CALCULATE ROVER HEADING (POLAR CORRECTED)
% ==========================================
lat = route_data.lat;
lon = route_data.lon;

% 1. Calculate the change in coordinates (in degrees)
delta_lat = diff(lat);
delta_lon = diff(lon);

% 2. Prevent glitches if the rover crosses the 180 / -180 longitude meridian
delta_lon(delta_lon > 180) = delta_lon(delta_lon > 180) - 360;
delta_lon(delta_lon < -180) = delta_lon(delta_lon < -180) + 360;

% 3. CONVERT DEGREES TO PHYSICAL METERS
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
assignin('base', 'route_distance', distance_m);
assignin('base', 'route_elevation', elevation_m);
assignin('base', 'route_temp', route_temp);
assignin('base', 'route_illum', route_illum);
assignin('base', 'route_heading', heading_rad);

% Find the total length of route
route_max_dist = max(distance_m);
assignin('base', 'route_max_dist', route_max_dist);

disp('Quickmap Route Data (Elevation, Temp, Illum, Heading) successfully loaded!');