% --- CONSTANTS ---
Constant.T_moon_K = 220;           % Moon surface temperature [K]
Constant.angle_sun_deg = 88.5;     % Solar zenith angle [°]
Constant.sigma = 5.670e-8;         % Stefan-Boltzmann constant [W m^-2 k^-4]
Constant.k_aluminum = 150;     % Thermal conductivity [W/(m*K)]


% --- THERMAL SPECIFICATIONS ---
% alpha = Solar absorptance | epsilon = IR absorptance/emittance
% radiator
Spec.alpha_rad = 0.15;    % Solar absorptance - Radiator 
Spec.epsilon_rad = 0.85; % IR absorptance - Radiator
Spec.mass_rad_kg = 0.5;
Spec.cp_rad_J_kgK = 897;

% chassis
Spec.mass_chassis_kg = 25;
Spec.cp_chassis_J_kgK = 897;

% electronics
Spec.mass_electronics_kg = 3;
Spec.cp_electronics_J_kgK = 1000;

% mli
Spec.alpha_mli = 0.35;    % Solar absorptance - MLI
Spec.epsilon_mli = 0.85;  % IR absorptance - MLI
Spec.epsilon_eff_leak_mli = 0.03; % Effective leak value - MLI
Spec.mass_mli = 1.5;
Spec.cp_mli_J_kgK = 1000;


% Internal Conduction

Cond.area_core_chassis = 0.04; % Baseplate footprint [m^2]
Cond.thick_core_chassis = 0.005; % Baseplate thickness [m]
Cond.k_core_chassis = 150; % Thermal conductivity [W/(m*K)]

Cond.area_chassis_rad = 0.008; % Cross-section of frame [m^2]
Cond.thick_chassis_rad = 0.2;  % Distance up to radiator [m]
Cond.k_chassis_rad = 150; % Thermal conductivity [W/(m*K)]

% --- SURFACE AREAS [m^2] ---
Area.front = 0.12;
Area.back = 0.12;         
Area.top = 0.05;
Area.bottom = 0.24;       
Area.left = 0.18;         
Area.right = 0.18;        
Area.rad = 0.24;        % Radiator surface area