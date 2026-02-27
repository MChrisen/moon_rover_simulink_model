% --- CONSTANTS ---
Constant.T_moon_K = 220;           % Moon surface temperature [K]
Constant.angle_sun_deg = 88.5;     % Solar zenith angle [°]
Constant.sigma = 5.670e-8;         % Stefan-Boltzmann constant [W m^-2 k^-4]

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
Spec.alpha_mli = 0.35;    % Solar absorptance - MLI (Multi-Layer Insulation)
Spec.epsilon_mli = 0.85;  % IR absorptance - MLI
Spec.mass_mli = 1.5;
Spec.cp_mli_J_kgK = 1000;

% Internal Conduction


% --- SURFACE AREAS [m^2] ---
Area.front = 0.12;
Area.back = 0.12;         
Area.top = 0;
Area.bottom = 0.24;       
Area.left = 0.18;         
Area.right = 0.18;        
Area.rad = 0.24;        % Radiator surface area