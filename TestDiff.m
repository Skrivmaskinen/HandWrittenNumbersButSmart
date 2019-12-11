function [ ] = TestDiff( image, diff)
%UNTITLED2 Summary of this function goes here
%   TestDiff(testDigit(:, :, digitID), Tt(:, operation, digitID))
    diff = vec2mat(diff, 20);
    diff = diff';
    colorImage(:, :, 1) = image;
    colorImage(:, :, 2) = image;
    colorImage(:, :, 3) = image;
    
    colorDiff (:, :, 1) = diff;
    colorDiff (:, :, 2) = diff;
    colorDiff (:, :, 3) = diff;
    
    addDiff = colorImage + colorDiff;
    subDiff = colorImage - colorDiff;
    
    % Enlarge
    colorImage = imresize(colorImage, 2);
    addDiff = imresize(addDiff, 2);
    subDiff = imresize(subDiff, 2);
    colorDiff = imresize(colorDiff, 2);
    
    % Rescale diff
    %colorDiff = colorDiff - min(colorDiff);
    %colorDiff = colorDiff./max(colorDiff);
    colorDiff1 = max(colorDiff, 0);
    colorDiff2 = -1*min(colorDiff, 0);
    
    % Red lines
    colorImage(20, :, :) = 0;
    colorImage(20, :, 1) = 1;
    
    addDiff(20, :, :) = 0;
    addDiff(20, :, 1) = 1;
    
    subDiff(20, :, :) = 0;
    subDiff(20, :, 1) = 1;
    
    colorDiff1(20, :, :) = 0;
    colorDiff1(20, :, 1) = 1;
    colorDiff2(20, :, :) = 0;
    colorDiff2(20, :, 1) = 1;   
    
    % Verticall
    colorImage(:, 20, :) =- 0.5;
    colorImage(:, 20, 1) =+ 0.7;
    
    addDiff(:, 20, :) = 0;
    addDiff(:, 20, 1) = 1;
    
    subDiff(:, 20, :) = 0;
    subDiff(:, 20, 1) = 1;
    
    colorDiff1(:, 20, :) = 0;
    colorDiff1(:, 20, 1) = 1;
    colorDiff2(:, 20, :) = 0;
    colorDiff2(:, 20, 1) = 1;
    
    twoDiff = colorDiff1;
    twoDiff(41:43, 1:40, :) = 1;
    twoDiff = [twoDiff; colorDiff2];
    
    %twoDiff(42:82, 1:40) = colorDiff2;
    
    figure(1)
    subplot(1, 4, 1), imshow( colorImage, 'InitialMagnification', 'fit');
    subplot(1, 4, 2), imshow( twoDiff, 'InitialMagnification', 'fit');
    subplot(1, 4, 3), imshow( addDiff, 'InitialMagnification', 'fit');
    subplot(1, 4, 4), imshow( subDiff, 'InitialMagnification', 'fit');
    %subplot(2, 4, 6), imshow( colorDiff2, 'InitialMagnification', 'fit');
    
end

