clear classes;clear variables;close all;clc;

% Add FIRM toolbox and external toolboxes as needed to the Matlab path
addpath(genpath(pwd))
add_external_toolboxes()

% Parameters
user_data = user_data_class; % The object user_data will never be used. This line only cause the "Constant" properties of the "user_data_class" class to be initialized.
if user_data_class.par.Cancel_Run == 1
    disp('User canceled the program run.')
    break
end

% The following lines should be read from USER_INPUT asap.
state_agent = 'multi_robot_positional_state';
mm_agent = 'RandomWalk';
om_agent = 'Full_state_additive_Gaussian';
belief_agent = 'multi_robot_positional_belief';

agent = agent_class(nan, state_agent, mm_agent, om_agent, belief_agent);

% instantiate the simulator
simulator = 'EmbeddedSimulator';
sim = feval(simulator);
sim = sim.initialize(agent);

% This is where you should write your specific planning problem
prob_inst = Planning_Problem(sim,agent);
prob_inst = prob_inst.solve();

% Close the simulator
sim = sim.simDelete();
