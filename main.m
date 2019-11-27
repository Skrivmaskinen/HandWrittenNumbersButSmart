%% Handwritten number classification
load('uspsDigits.mat')

imshow(testDigits(:, :, 13), 'InitialMagnification', 'fit')
%EuclideanDistance(testDigits(:, :, 1), testDigits(:, :, 2))

%%
prediction = zeros(size(testAns));
for test_id = 1:2007 %2007
    tested_image = testDigits(:, :, test_id);
    
    closest_id = 0;
    closest_value = inf('double');
    
    for train_id = 1:7291
        train_dist = EuclideanDistance( tested_image, trainDigits(:, :, train_id) );
        if (closest_value > train_dist)
            closest_value = train_dist;
            closest_id    = train_id;
        end
        
    end
    prediction(test_id) = trainAns(closest_id);
end

%%
result = (testAns(1:2007) == prediction(1:2007));

sum(result)/2007 % 94.37 procent correct

