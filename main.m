%% Handwritten number classification
clc
clear

load('numbers20_blur.mat')

imshow(testzip(:, :, 13), 'InitialMagnification', 'fit')
%EuclideanDistance(testDigits(:, :, 1), testDigits(:, :, 2))

%% Calculate difference

% x_translation_train_bread = zeros(size(azip, 1)^2, length(azip));
% 
% for i = 1:length(azip)
%    shifted = zeros(20);
%    shifted(:, 2:20) = azip(:, 1:19, i);
%    delta = azip(:, :, i) - shifted;
%    x_translation_train_bread(:, i) = delta(:);
% 
% end
%T-matrix for training data  
Tp(:,:,:) = TransformationTensor(azip);
%T-matrix for test data
Tt(:,:,:) = TransformationTensor(testzip);



% x_translation_test_bread = zeros(size(testzip, 1)^2, size(testzip, 3));
% 
% for i = 1:length(testzip)
%    shifted = zeros(20);
%    shifted(:, 2:20) = testzip(:, 1:19, i);
%    delta = testzip(:, :, i) - shifted;
%    x_translation_test_bread(:, i) = delta(:);
% 
% end

%% Dumb prediction. Takes ages

span = 1:3;

prediction = zeros(size(span));
for test_id = span %2007
    tested_image = testzip(:, :, test_id);
   
    closest_id = 0;
    closest_value = inf('double');
    
    for train_id = 1:7291
        train_dist = tangentDiff( tested_image, azip(:, :, train_id), Tt(:,:,test_id),  Tp(:,:,train_id) );
        %train_dist = EuclideanDistance( tested_image, azip(:, :, train_id) );
        if (closest_value > train_dist)
            closest_value = train_dist;
            closest_id    = train_id;
        end    
    end
    prediction(test_id) = dzip(closest_id);
end

%% How good is dumb prediction?
result = (dtest(span) == prediction);

sum(result)/3 % 94.37 procent correct

%% 

load('numbers20_blur.mat')

