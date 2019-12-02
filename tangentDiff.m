function [ out_distance ] = tangentDiff( p, e, Tp, Te )
% Get the tangent distance from point p to e.
%   Detailed explanation goes here
    A = [-Tp Te];
    b = p - e;
    b = b(:);
    
    x = A\b;
    r = norm(b-A*x);
    % Out
    out_distance = r;
end

