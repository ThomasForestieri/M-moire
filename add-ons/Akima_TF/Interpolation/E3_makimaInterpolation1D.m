%==============================================================================
% This code is an extension of the Matlab-based toolbox
% FAIR - Flexible Algorithms for Image Registration to
% use Akima's method. 
% For details see 
% - https://github.com/C4IR and
% - http://www.siam.org/books/fa06/
%==============================================================================

dataT = [0,2,2,2,1]; 
m     = length(dataT);  
omega = [0,m]; 
xc    = getCellCenteredGrid(omega,m);
xf    = linspace(-1,6,101);             

Tf = interp1(xc, dataT, xf, 'makima');

FAIRfigure(1); clf; 
ph = plot(xc,dataT,'.',xf,Tf,'g-','markersize',30); 
%==============================================================================
