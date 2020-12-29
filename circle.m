function h = circle(x,y,r)
    %%%%%%%%%%%%%%%%%%
    % circle
    % input: x,y,r
        % (x, y): center of the circle
        % r: radius
    % output: 
        % plot circle at center (x, y) with radius r 
    % functions:
    %%%%%%%%%%%%%%%%%%
    hold on
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    h = plot(xunit, yunit);
    hold off
end