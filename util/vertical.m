% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
% $Id: vertical.m 1204 2014-08-05 13:29:53Z d.mercier $
function vec = vertical(vec, varargin)
%% Function used to ensure that a 3 component vector is vertical
% vec: Vector indices

if nargin == 0
   vec = rand(1,3);
end

if numel(vec) ~= 3
    error('only 3 elem vecs');
end

if size(vec) == [3,1]
    return
else
    vec = vec';
end

end
