i = 2;
j = 1;
start = prob_inst.PRM.nodes(i).val;
endPoint = prob_inst.PRM.nodes(j).val;

[~,edge_ind] = intersect(prob_inst.PRM.edges_list, [i j], 'rows');

x = start;
for k = 1:length(prob_inst.PRM.edges(edge_ind).u)

    u = prob_inst.PRM.edges(edge_ind).u(:,k);
    w = MotionModel_class.zeroNoise;
    
    x = MotionModel_class.f_discrete(x,u,w);
    
    xState = state(x);
    xState = xState.draw();
    drawnow
    %pause(0.3)
end
