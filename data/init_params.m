% --- CONSTANTS ---
Constant.T_moon_K = 200;           % Moon surface temperature [K]
Constant.angle_sun_deg = 88.5;     % Solar zenith angle [°]
Constant.solar_constant_W_m2 = 1361; % Solar constant [W/m^2]

% --- THERMAL SPECIFICATIONS ---
% alpha = Solar absorptance | epsilon = IR absorptance/emittance
Spec.alpha_rad = 0;    % Solar absorptance - Radiator 
Spec.epsilon_rad = 0.11; % IR absorptance - Radiator
Spec.alpha_mli = 0;    % Solar absorptance - MLI (Multi-Layer Insulation)
Spec.epsilon_mli = 0;  % IR absorptance - MLI

% --- SURFACE AREAS [m^2] ---
Area.front = 0;
Area.back = 0;         
Area.top = 0;
Area.bottom = 0;       
Area.left = 0;         
Area.right = 0;        
Area.rad = 0.5;        % Radiator surface area