function [ DP ] = Scaling( point )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    uppscaled = imresize(point, [22 22]);
    DP = point - uppscaled(2:21,2:21);
    DP = DP(:);
end

