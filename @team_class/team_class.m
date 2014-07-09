classdef team_class
    % This class encapsulates the "team" concept in FIRM
    % (Feedback-controller-based Information-state RoadMap).
    properties
        ss; %joint state of entire team
        mm; %joint motion model
        om; %joint observation model
        belief; %current state
        agents; %all agents
    end
    
    methods
        function obj = team_class( n_agents, state_agents, mm_agents, om_agents, belief_agents, state_team, mm_team, om_team, belief_team )
            obj.agents = obj.construct_agents(n_agents, state_agents, mm_agents, om_agents, belief_agents );
            
            obj.ss = feval(state_team,[], n_agents);
            obj.mm = feval(str2func(mm_team), obj.ss);
            obj.om = feval(str2func(om_team), obj.ss);
            obj.belief = feval(str2func(belief_team), obj.ss);
        end
        
        function agents = construct_agents(obj, n_agents, state_agents, mm_agents, om_agents, belief_agents )
            for idx_agent = 1:n_agents
                agents(idx_agent) = agent_class(idx_agent, state_agents{idx_agent}, mm_agents{idx_agent}, om_agents{idx_agent}, belief_agents{idx_agent});
            end
        end
    end
end