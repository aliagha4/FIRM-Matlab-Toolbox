%MDL_P8 Create model of Puma robot on an XY base
%
%      mdl_p8
%
% Script creates the workspace variable p8 which is an 8-axis robot
% comprising a Puma 560 robot on an XY base.  Joints 1 and 2 are the base,
% joints 3-8 are the robot arm.
%
% Also define the workspace vectors:
%   qz         zero joint angle configuration
%   qr         vertical 'READY' configuration
%   qstretch   arm is stretched out in the X direction
%   qn         arm is at a nominal non-singular configuration
%
% See also SerialLink, mdl_puma560.

% Copyright (C) 1993-2011, by Peter I. Corke
%
% This file is part of The Robotics Toolbox for Matlab (RTB).
% 
% RTB is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% RTB is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with RTB.  If not, see <http://www.gnu.org/licenses/>.

% create the base
platform = SerialLink( [0 0 0 -pi/2 1; -pi/2 0 0 pi/2 1], ...
    'base', troty(pi/2), 'name', 'platform' ); 

% load the standard Puma
mdl_puma560;
% add the pedestal height to link 1
p560.links(1).d = 30 * 0.0254;

% compose the two robots
p8 = SerialLink( [platform, p560], 'name', 'P8');
