function g = G_K(x)
    %%%%%%%%%%%%%%%%%%
    % G_K
    % input: x = [z; q; tau]
        % z: position of vehicle,
        % q: mode
        % tau: timer
    % output: g
    % functions:
    %%%%%%%%%%%%%%%%%%
    
    % parameters
    global z_s z_h nu rho_s T_s_11 T_s

    % variable
    z = x(1:2);
    q = x(3);
    tau = x(4);

    if ( q == 1 && norm(z-z_s) <= 3/4 * rho_s  && tau <= T_s_11 && tau >= 0) || ( q == 2 && norm(z-z_s) <= 3/4 * rho_s )
        g = 0;
    elseif ( q == 2 && norm(z-z_h) <= 1/8 * rho_s )
        g = 1;
    elseif ( q == 0 && norm(z-z_s) >= rho_s ) || ( q == 1  && tau >= T_s)
         g = 2;
    end
end