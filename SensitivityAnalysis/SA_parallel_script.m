%% 1. Initialize Workspace
disp('Loading workspace variables...');
init_params;
data_loading;

%% 2. Load Parameters
% Extract the 1000 parameters from the App's save file
disp('Loading parameter set...');
load('MoonRoverNMSS_sasession.mat', 'ParamSet'); 
numSims = height(ParamSet);

%% 3. Setup Simulation Input Array
disp(['Building array for ', num2str(numSims), ' simulations...']);
simIn(1:numSims) = Simulink.SimulationInput('MoonRoverNMSS');

for idx = 1:numSims
    % Apply Accelerator Mode
    simIn(idx) = simIn(idx).setModelParameter('SimulationMode', 'accelerator');
    
    % Apply Parameters
    simIn(idx) = simIn(idx).setVariable('test_bat_AH', ParamSet.test_bat_AH(idx));
    simIn(idx) = simIn(idx).setVariable('test_pcm_mass', ParamSet.test_pcm_mass(idx));
end

%% 4. Execute Parallel Run
disp('Starting Parallel Execution. Monitor your Activity Monitor...');
% UseFastRestart is 'off' to prevent Simscape memory leaks
out = parsim(simIn, 'ShowProgress', 'on', 'UseFastRestart', 'off');

disp('Analysis Complete! Results saved to ''out'' variable.');