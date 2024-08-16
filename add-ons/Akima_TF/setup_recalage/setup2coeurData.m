%==============================================================================

checkDataFile
if expfileExists, return; end;
viewPara = {'viewImage','viewImage2D','colormap','gray(256)'};
expfile = jpgs2data('','Coeur1.jpg','Coeur2.jpg','omega',[0,2,0,1],'viewPara',viewPara,'m',[303,256]);
checkDataFile
%==============================================================================
