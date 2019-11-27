function [ residual ] = EuclideanDistance( pointA, pointB )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    diff = pointA(:, :) - pointB(:, :);
    diff = diff.^2;
    residual = sqrt( sum(sum(diff)) );

end

