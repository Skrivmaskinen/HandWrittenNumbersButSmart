%% Handwritten number classification
clc
clear

load('numbers20_blur.mat')

% Change variable names
testDigit = testzip;
testAnswear = dtest;
trainingDigit = azip;
trainingAnswear = dzip;
clear testzip
clear dtest
clear azip
clear dzip

% imshow(testDigit(:, :, 13), 'InitialMagnification', 'fit')
% EuclideanDistance(testDigits(:, :, 1), testDigits(:, :, 2))

%% Calculate difference
% T-matrix for training data  
% (Data-point, transformation-type, digit-id)
Tp = Transformations(trainingDigit);
%T-matrix for test data
Tt = Transformations(testDigit);

%% Smart prediction. Takes ~1 second / digit
% maximum: 2007
span = 1:2007;

prediction = zeros(size(span));
tic
for test_id = span 
    
    tested_image = testDigit(:, :, test_id);
    
    closest_id = 0;
    closest_value = inf('double');
    
    for train_id = 1:7291
       
        train_dist = tangentDiff( tested_image, trainingDigit(:, :, train_id), Tt(:,:,test_id),  Tp(:,:,train_id) );
       
        %train_dist = EuclideanDistance( tested_image, trainingDigit(:, :, train_id) );
        if (closest_value > train_dist)
            closest_value = train_dist;
            closest_id    = train_id;
        end    
    end
    test_id
    toc
    prediction(test_id) = trainingAnswear(closest_id);
end
toc
%% How good is dumb prediction?
result = (testAnswear(span) == prediction);

sum(result)/length(span)
% 94.37 procent correct
% 98.00 procent correct

% 96.91 procent correct
%% 

load('numbers20_blur.mat')

