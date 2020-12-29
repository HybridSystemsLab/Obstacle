function u = kappa(x)
    %%%%%%%%%%%%%%%%%%
    % kappa
    % input: x = [z; q; tau]
        % z: position of vehicle,
        % q: mode
        % tau: timer
    % output: u
        % control input
    % functions:
    %%%%%%%%%%%%%%%%%%

    % parameters
    global z_s nu z_h

    % variable
    z = x(1:2);
    q = round(x(3));

    if ( q == 0 )
        u = -(z - z_s);
    elseif ( q == 1 )
        u = nu;
    elseif ( q == 2 )
        u = -(z - z_h);
    end
end