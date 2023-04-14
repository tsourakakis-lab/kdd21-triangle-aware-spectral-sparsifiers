function [Er, E] = helperFunction( graph_file )
    edges = dlmread(graph_file); 
    n = edges(1,1); 
    m = edges(1,2);
    E = edges(2:end,1:2);
    
    if size(edges,2) < 3 
        w = ones(length(E),1);
    else
        w = edges(2:end,3);
    end

    if n > 2000
        method = 'spl';
    else
        method = 'org';
    end
    if n <= 15000
	epsilon = 0.01
    elseif n <= 500000
        epsilon  = 0.05;
    else
        epsilon = 0.075;
    end
    if length(E) < 15000000
    	Er = EffectiveResistances(E,E,w,1e-5,epsilon,method);
    else
	Er = zeros(length(E),1);
    end
end
