function [xderr, yderr] = TranslationX(inPictures)
    xderr = zeros(22, 22, length(inPictures));
    xderr(2:21, 2:21, :) = inPictures(:, :, :);
    yderr = xderr;
    
    xderr(2:21, 2:21, :) = (xderr(1:20, 2:21, :) - xderr(3:22, 2:21, :))/2;
    yderr(2:21, 2:21, :) = (yderr(2:21, 1:20, :) - yderr(2:21, 3:22, :))/2;
    xderr = xderr(2:21, 2:21, :);
    yderr = yderr(2:21, 2:21, :);
end

