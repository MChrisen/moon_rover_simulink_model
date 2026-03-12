% --- CONSTANTS ---
Constant.sigma = 5.670e-8;         % Stefan-Boltzmann constant [W m^-2 k^-4]


% --- THERMAL SPECIFICATIONS ---
% alpha = Solar absorptance | epsilon = IR absorptance/emittance
% radiator
Spec.alpha_rad = 0.09;    % Solar absorptance - Radiator //
Spec.epsilon_rad = 0.91;  % IR absorptance - Radiator //
Spec.mass_rad_kg = 0.1;
Spec.cp_rad_J_kgK = 896; % aluminium 6061-T6 //

% chassis
Spec.mass_chassis_kg = 7;
Spec.cp_chassis_J_kgK = 896; % aluminium 6061-T6 //

% electronics
Spec.mass_electronics_kg = 5;
Spec.cp_electronics_J_kgK = 1000;

% mli
Spec.alpha_mli = 0.35;    % Solar absorptance - MLI
Spec.epsilon_mli = 0.85;  % IR absorptance - MLI
Spec.epsilon_eff_leak_mli = 0.03; % Effective leak value - MLI
Spec.mass_mli = 0.900;
Spec.cp_mli_J_kgK = 1000;

% PCM
Spec.mass_PCM = 0.7; % [kg]
Spec.cp_PCM_J_kgK = 2000; % octadecane //


% Internal Conduction (Adjusted for realistic Contact Resistance)
Cond.area_core_chassis = 0.04; 
Cond.thick_core_chassis = 0.005; 
Cond.k_core_chassis = 5; % Realistic bolted joint/TIM

Cond.area_core_PCM = 0.20; 
Cond.thick_core_PCM = 0.005; % Increased from 1mm to 5mm for solver stability
Cond.k_core_PCM = 10; % High-quality thermal paste/epoxy

Cond.area_PCM_rad = 0.20;
Cond.thick_PCM_rad = 0.0075;
Cond.k_PCM_rad = 5; % Realistic bolted joint/TIM


% --- SURFACE AREAS [m^2] ---
Area.front = 0.20 * 0.40;
Area.back = 0.20 * 0.40;         
Area.top = 0.1; %er inkluderet i modellen, har en værdi på 0, da radiator dækker hele toppen SLET
Area.bottom = 0.50 * 0.40;       
Area.left = 0.20 * 0.50;         
Area.right = 0.20 * 0.50;      
Area.rad = 0.20 * 0.50;        % Radiator surface area

% --- SIM PARAMETERS ---
P.driving_speed = 0.75;     % [m/s]
P.mass_rover = 15;          % [kg]

P.temp_load_shedding_off = 300; % [K]
P.temp_load_shedding_on = 328;  % [K]

P.power_avionics = 20; % [W]

P.gamma_start_sun = 45; % Sun starting azimuth [degrees]
P.z_start_sun = 89.5; % Sun starting zenith [degrees]
% --- INITIAL CONDITIONS ---
IC.temp_core = 293; % [K]
IC.temp_chassis = 293; % [K]
IC.temp_rad = 220; % [K]
IC.temp_PCM = 293; % [K]

IC.power_motor = 0.5; % [W]

% Initial MLI temp [K]
IC.temp_MLI_front = 220; 
IC.temp_MLI_back = 220;
IC.temp_MLI_top = 220;
IC.temp_MLI_bottom = 220;
IC.temp_MLI_right = 220;
IC.temp_MLI_left= 220;