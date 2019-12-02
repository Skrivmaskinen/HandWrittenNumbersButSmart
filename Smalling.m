function [ DP ] = Smalling( point )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    DP = point;
    
    downscaled = imresize(point, [18 18]);
    DP(2:19, 2:19) =- downscaled;
    DP = DP(:);

end

