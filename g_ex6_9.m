function xplus = g_ex6_9(x)
    %%%%%%%%%%%%%%%%%%
    % jump map
    % input: x = [z; q; tau]
        % z: position of vehicle,
        % q: mode
        % tau: timer
    % output: xplus
        % jump map
    % functions:
        % g = G_K(x)
    %%%%%%%%%%%%%%%%%%

    % variable
    z = x(1:2);
    q = x(3);
    %tau = x(4);
    % function 
    g = G_K(x);
    % difference equation
    xplus = [z; g; 0];
end