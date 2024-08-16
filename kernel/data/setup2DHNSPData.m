%==============================================================================

checkDataFile
if expfileExists, return; end;
viewPara = {'viewImage','viewImage2D','colormap','gray(256)'};
expfile = jpgs2data('','HNSP-T.jpg','HNSP-R.jpg','omega',[0,2,0,1],'viewPara',viewPara,'m',[512,256]);
checkDataFile
%==============================================================================
