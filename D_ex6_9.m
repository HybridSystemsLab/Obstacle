function inside = D_ex6_9(x) 
    %%%%%%%%%%%%%%%%%%
    % jump set
    % input: x = [z; q; tau]
        % z: position of vehicle,
        % q: mode
        % tau: timer
    % output: inside
        % jump set
    % functions:
    %%%%%%%%%%%%%%%%%%
    % parameters
    global z_s z_h nu rho_s T_s_11 T_s
    % variable
    z = x(1:2);
    q = x(3);
    tau = x(4);
    % jump conditions
    DD = ( q == 0 && norm(z-z_s) >= rho_s ) || ...
         ( q == 1 && norm(z-z_s) <= 3/4 * rho_s  && tau <= T_s_11 && tau >= 0) ||...
         ( q == 1  && tau >= T_s) ||...
         ( q == 2 && norm(z-z_s) <= 3/4 * rho_s ) ||...
         ( q == 2 && norm(z-z_h) <= 1/8 * rho_s );

    if ( DD )
        inside = 1;
    else
        inside = 0;
    end
end