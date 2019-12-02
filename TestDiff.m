function [ ] = TestDiff( image, diff)
%UNTITLED2 Summary of this function goes here
%   TestDiff(testzip(:, :, 1), vec2mat(Tt(:, 1, 1), 20))
    diff = diff';
    colorImage(:, :, 1) = image;
    colorImage(:, :, 2) = image;
    colorImage(:, :, 3) = image;
    
    together = [colorImage+diff colorImage colorImage-diff];
    together(:, 10, :) = 0;
    together(:, 10, 1) = 1;
    together(:, 30, :) = 0;
    together(:, 30, 1) = 1;
    together(:, 50, :) = 0;
    together(:, 50, 1) = 1;
    together(10, :, :) = 0;
    together(10, :, 1) = 1;
    
    figure(1)
    imshow( together, 'InitialMagnification', 'fit');
end

