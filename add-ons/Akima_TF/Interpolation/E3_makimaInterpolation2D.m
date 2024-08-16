%==============================================================================
% This code is an extension of the Matlab-based toolbox
% FAIR - Flexible Algorithms for Image Registration to
% use Akima's method. 
% For details see 
% - https://github.com/C4IR and
% - http://www.siam.org/books/fa06/
%==============================================================================


dataT = flipud([1,2,3,4;1,2,3,4;4,4,4,4]); 
m     = size(dataT); 
omega = [0, m(1), 0, m(2)]; 
M     = {m, 10 * m};   % deux résolutions

% Grilles centrées sur les cellules
xc    = reshape(getCellCenteredGrid(omega, M{1}), [], 2);
xf    = reshape(getCellCenteredGrid(omega, M{2}), [M{2}, 2]);

[X, Y] = meshgrid(0.5:1:3.5, 0.5:1:2.5);
[Xq, Yq] = meshgrid(xf(1,:,2), xf(:,1,1));

Tf = interp2(X, Y, dataT, Xq, Yq, 'makima');

% Affichage
FAIRfigure(3); clf;
ph = plot3(xc(:, 2), xc(:, 1), reshape(dataT,1,12)', 'ro'); hold on;
qh = surf(Xq, Yq, Tf);

%==============================================================================
