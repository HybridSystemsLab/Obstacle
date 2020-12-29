function value = C_ex6_9(x)
    %%%%%%%%%%%%%%%%%%
    % flow set
    % input: x = [z; q; tau]
        % z: position of vehicle,
        % q: mode
        % tau: timer
    % output: value
        % flow set
    % functions:
    %%%%%%%%%%%%%%%%%%
    % parameters
    global z_s z_h nu rho_s T_s_11 T_s

    % variable
    z = x(1:2);
    q = x(3);
    tau = x(4);
    % flow conditions
    cc = ( q == 0 && norm(z-z_s) <= rho_s ) ||...
         ( q == 1 && norm(z-z_s) >= 3/4 * rho_s  && tau <= T_s && tau >= 0) ||...
         ( q == 2 && norm(z-z_h) >= 1/16 * rho_s );

    if ( cc )
        value = 1;
    else
        value = 0;
    end
end