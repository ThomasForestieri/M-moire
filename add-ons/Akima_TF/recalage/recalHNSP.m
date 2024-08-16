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

setup2DHNSPData; close all;

T = dataT; 
xc = @(m) getCellCenteredGrid(omega,m);


tStartlin = tic; 
imgModel('set','imgModel','linearInter');
Tc = imgModel(T,omega,xc(m));
FAIRfigure(1); viewImage2D(Tc,omega,m); colormap(gray(256));
title('Interpolation linéaire');
tEndlin = toc(tStartlin);


tStartSpline = tic; 
imgModel('set','imgModel','splineInter');
T = getSplineCoefficients(T,'regularizer','moments');
Tc = imgModel(T,omega,xc(m));
figure(2);
viewImage2D(Tc,omega,m);
colormap(gray(256));
title('interpolation spline');
tEndSpline = toc(tStartSpline);


tStartMakima = tic;
imgModel('set','imgModel','makimaInter');
Tc = imgModel(T,omega,xc(m));
figure(3); 
viewImage2D(Tc,omega,m); colormap(gray(256));
title('interpolation Makima');
tEndMakima = toc(tStartMakima);

%tStartMakima = tic; 
%Tc = interp2(X, Y, dataT, Xq, Yq, 'makima');
%figure(3); 
%viewImage2D(Tc,omega,m); colormap(gray(256));
%title('interpolation spline');
%tEndMakima = toc(tStartMakima);
 
%{
k     = size(dataT); 
omega = [0, k(1), 0, k(2)]; 
M     = {k, 10 * k};   % deux résolutions

tStartMakima = tic; 
% Grilles centrées sur les cellules
xc    = reshape(getCellCenteredGrid(omega, M{1}), [], 2);
xf    = reshape(getCellCenteredGrid(omega, M{1}), [M{1}, 2]);

% Interpolation avec makima
[X, Y] = meshgrid(0.5:1:511.5, 0.5:1:255.5);
[Xq, Yq] = meshgrid(xf(1,:,2), xf(:,1,1));

Tc = interp2(X, Y, dataT', Xq, Yq, 'makima');

figure(3); 
viewImage2D(Tc,omega,m); colormap(gray(256));
title('interpolation makima');
tEndMakima = toc(tStartMakima);
%}
%==============================================================================
