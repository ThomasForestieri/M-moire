%==============================================================================
% This code is part of the Matlab-based toolbox
% FAIR - Flexible Algorithms for Image Registration. 
% For details see 
% - https://github.com/C4IR and
% - http://www.siam.org/books/fa06/
%==============================================================================
%
% Tutorial for FAIR: interpolation in 2D
%
% - load data   (setup2DUSData)
% - interpolate (linearInter) on different resolutions
% - visualize   (viewImage2D)
% - image model (splineInter) on different resolutions
% - visualize   (viewImage2D)
%==============================================================================

setup2DreinData; close all;

T = dataR; 
xc = @(m) getCellCenteredGrid(omega,m); 

tStartlin = tic; 
imgModel('set','imgModel','linearInter');
Tc = imgModel(T,omega,xc(m));
FAIRfigure(1); viewImage2D(Tc,omega,m); colormap(gray(256));
title('Interpolation linéaire');
tEndlin = toc(tStartlin)


tStartSpline = tic; 
imgModel('set','imgModel','splineInter');
T = getSplineCoefficients(T,'regularizer','moments');
Tc = imgModel(T,omega,xc(m));
figure(2); viewImage2D(Tc,omega,m); colormap(gray(256));
title('interpolation spline');
tEndSpline = toc(tStartSpline)
 



%==============================================================================
