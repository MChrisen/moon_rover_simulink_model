% --- CONSTANTS ---
Constant.sigma = 5.670e-8;         % Stefan-Boltzmann constant [W m^-2 k^-4]


% --- THERMAL SPECIFICATIONS ---
% alpha = Solar absorptance | epsilon = IR absorptance/emittance
% radiator
Spec.alpha_rad = 0.09;    % Solar absorptance - Radiator //
Spec.epsilon_rad = 0.91;  % IR absorptance - Radiator //
Spec.mass_rad_kg = 1.8;
Spec.cp_rad_J_kgK = 896; % aluminium 6061-T6 //

% chassis
Spec.mass_chassis_kg = 11.3;
Spec.cp_chassis_J_kgK = 896; % aluminium 6061-T6 //

% electronics
Spec.mass_electronics_kg = 5.07; % 
Spec.cp_electronics_J_kgK = 830; % for batteriet

% mli
Spec.alpha_mli = 0.35;    % Solar absorptance - MLI
Spec.epsilon_mli = 0.85;  % IR absorptance - MLI
Spec.epsilon_eff_leak_mli = 0.03; % Effective leak value - MLI
Spec.cp_mli_J_kgK = 1170;

% PCM
Spec.mass_PCM = 0.7; % [kg]
Spec.cp_PCM_J_kgK = 1908; % octadecane //

% Cover (area, see solar panel)
Spec.mass_cover = 0.91;
Spec.cp_cover = 896;
Spec.epsilon_back_cover = 0.03;
Spec.epsilon_front_cover = 0.85;
Spec.alpha_front_cover = 0.91;

Spec.solar_eff = 0.30;

% Internal Conduction
Cond.area_core_chassis = 0.0312; 
Cond.thick_core_chassis = 0.0254; 
Cond.k_core_chassis = 1.38; % stycast

Cond.area_core_PCM = 0.1656; 
Cond.thick_core_PCM = 0.02; % Tykkelsen af PCM kasse
Cond.k_core_PCM = 15; % Aluminium / midl

Cond.area_PCM_rad = 0.1656;
Cond.thick_PCM_rad = 0.02;% Tykkelse pcm kasse
Cond.k_PCM_rad = 15; % Aluminium / midl

Cond.area_chassis_PCM = 0.00892; 
Cond.thick_chassis_PCM = 0.02; 
Cond.k_chassis_PCM = 1.38; % stycast


% --- SURFACE AREAS [m^2] ---
Area.front = 0.20 * 0.40;
Area.back = 0.20 * 0.40;         
Area.top = 0.1; %er inkluderet i modellen, har en værdi på 0, da radiator dækker hele toppen SLET
Area.bottom = 0.50 * 0.40;       
Area.left = 0.20 * 0.50;         
Area.right = 0.20 * 0.50;      
Area.rad = 0.20 * 0.50;        % Radiator surface area
Area.solar_panel = 0.20 * 0.50;

% --- SIM PARAMETERS ---
P.driving_speed = 0.75;     % [m/s]
P.mass_rover = 17.37;          % [kg] %MANGLER

P.temp_load_shedding_off = 300; % [K]
P.temp_load_shedding_on = 302;  % [K]

P.power_avionics = 22.95; % [W]

P.gamma_start_sun = 45; % Sun starting azimuth [degrees]
P.z_start_sun = 89.5; % Sun starting zenith [degrees]

P.power_digging = 125.2; % [W]
P.time_digging = 30; % [s]
P.power_load = 6.98;
P.power_unload = 4.9;

P.mass_PCM = 0.7; % [kg]

% --- INITIAL CONDITIONS ---
IC.temp_core = 301; % [K]
IC.temp_chassis = 299; % [K]
IC.temp_rad = 300; % [K]
IC.temp_PCM = 300; % [K]

IC.power_motor = 0.5; % [W]

% Initial MLI temp [K]
IC.temp_MLI_front = 242; 
IC.temp_MLI_back = 265;
IC.temp_MLI_top = 220;
IC.temp_MLI_bottom = 230;
IC.temp_MLI_right = 272;
IC.temp_MLI_left= 248;


