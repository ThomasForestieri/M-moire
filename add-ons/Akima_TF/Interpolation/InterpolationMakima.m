function T = interpolationMakima(I, omega, xc)
    % Input:
    % I: Image to be interpolated
    % omega: Image domain
    % xc: Coordinates where interpolation is evaluated
    
    % Reshape coordinates
    m = size(I);
    x1 = reshape(xc(1,:),m(1),m(2));
    x2 = reshape(xc(2,:),m(1),m(2));
    
    % Perform Makima interpolation
    F = griddedInterpolant({linspace(omega(1),omega(2),m(1)), linspace(omega(3),omega(4),m(2))}, I, 'makima');
    T = F(x1, x2);
end