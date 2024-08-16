%==============================================================================
% This code is part of the Matlab-based toolbox
% FAIR - Flexible Algorithms for Image Registration. 
% For details see 
% - https://github.com/C4IR and
% - http://www.siam.org/books/fa06/
%==============================================================================
% Main function for the image model, uses persistent parameter
% Typical call       
%
%       Tc = imgModel(coefT,omega,yc);
%      
% =======================================================================================

function varargout = imgModelMakima(varargin)

% handle options
persistent OPTN 

if nargin == 0 & nargout == 0 %& isempty(OPTN),
  help(mfilename);
  runMinimalExample;
  return;
end;

% check for reset, set, clear, disp, see dealOptions.m
[method,OPTN,task,stop] = dealOptions(mfilename,OPTN,varargin{:});
if stop,  varargout = {method,OPTN};  return; end


% do the work
[method,optn] = dealOptions(mfilename,OPTN,...
	'set','doDerivative',(nargout>1),varargin{4:end});
k = find(strcmp(optn,mfilename));
optn (k:k+1) = [];
T         = varargin{1};
omega     = varargin{2};
x         = varargin{3}(:);

T    = feval(method,T,omega,x,optn{:});
varargout = {T};

%==============================================================================

