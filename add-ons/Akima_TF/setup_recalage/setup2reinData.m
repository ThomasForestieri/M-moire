%==============================================================================
% This code is based on the Matlab-based toolbox
% FAIR - Flexible Algorithms for Image Registration. 
% For details see 
% - https://github.com/C4IR and
% - http://www.siam.org/books/fa06/
%==============================================================================

checkDataFile
if expfileExists, return; end;
viewPara = {'viewImage','viewImage2D','colormap','gray(256)'};
expfile = jpgs2data('','rein1.jpg','rein2.jpg','omega',[0,2,0,1],'viewPara',viewPara,'m',[325,256]);
checkDataFile
%==============================================================================
