function xdot = f_ex6_9(x)
    %%%%%%%%%%%%%%%%%%
    % flow map
    % input: x = [z; q; tau]
        % z: position of vehicle,
        % q: mode
        % tau: timer
    % output: xdot
        % flow map
    % functions:
        % u = kappa(x) % compue control input
        % r = rho(q)   % 
    %%%%%%%%%%%%%%%%%%
    % variable
    z = x(1:2);
    q = x(3);
    tau = x(4);
    % functions
    u = kappa(x);
    r = rho(q);
    % differential equation
    xdot = [u; 0; r];
end