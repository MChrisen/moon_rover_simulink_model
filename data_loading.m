% 1. Load the Quickmap Slope Data
route_data = readtable('slope_data.csv');

% 2. Extract Distance and Convert to Meters.
% Quickmap exported 'position' in kilometers. We must convert to meters.
distance_km = route_data.position; 
distance_m = distance_km * 1000; % Now it goes from ~1.88 to 1300!

% 3. Extract Slope and Convert Degrees to Radians
% Quickmap exports 'TerrainSlope' in DEGREES.
slope_degrees = route_data.TerrainSlope;

% Simulink's sin() math blocks expect radians by default.
slope_radians = deg2rad(slope_degrees);

% 4. Send the variables to the Base Workspace for Simulink
assignin('base', 'route_distance', distance_m);
assignin('base', 'route_slope', slope_radians);

disp('Quickmap Slope data successfully loaded!');

% Find the exact total length of the route
route_max_dist = max(distance_m);
assignin('base', 'route_max_dist', route_max_dist);