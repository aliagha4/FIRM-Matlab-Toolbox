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


n_agents = user_data.par.state_parameters.num_robots;
state_agents = {'multi_robot_positional_state','multi_robot_positional_state','multi_robot_positional_state'};
mm_agents = {'RandomWalk', 'RandomWalk', 'RandomWalk'};
om_agents = {'Full_state_additive_Gaussian', 'Full_state_additive_Gaussian', 'Full_state_additive_Gaussian'};
belief_agents = {'multi_robot_positional_belief', 'multi_robot_positional_belief', 'multi_robot_positional_belief'};

state_team = 'multi_robot_positional_state';
mm_team = 'RandomWalk';
om_team = 'Full_state_additive_Gaussian';
belief_team = 'multi_robot_positional_belief';

simulator_team = 'EmbeddedSimulator_Decentralized';

team = team_class(n_agents, state_agents, mm_agents, om_agents, belief_agents, state_team, mm_team, om_team, belief_team);

% instantiate the simulator
sim = feval(simulator_team);
sim = sim.initialize(team);

% This is where you should write your specific planning problem
prob_inst = Dec_Planning_Problem(sim, team);
prob_inst = prob_inst.solve();

% Close the simulator
sim = sim.simDelete();
