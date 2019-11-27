%% Handwritten number classification

load('numbers20_blur.mat')

imshow(testDigits(:, :, 13), 'InitialMagnification', 'fit')
%EuclideanDistance(testDigits(:, :, 1), testDigits(:, :, 2))

%% Calculate difference

x_translation_bread = zeros(size(azip));

for i = 1:1
   shifted = zeros(20);
   shifted(2:20, :) = azip(1:19, :, i);
   figure(1)
   ima(shifted)
   figure(2)
   ima(azip(:, :, i))
end

%% Dumb prediction. Takes ages

span = 1:50;

prediction = zeros(size(span));
for test_id = span %2007
    tested_image = testzip(:, :, test_id);
   
    closest_id = 0;
    closest_value = inf('double');
    
    for train_id = 1:7291
        train_dist = EuclideanDistance( tested_image, azip(:, :, train_id) );
        if (closest_value > train_dist)
            closest_value = train_dist;
            closest_id    = train_id;
        end    
    end
    prediction(test_id) = dzip(closest_id);
end

%% How good is dumb prediction?
result = (dtest(span) == prediction);

sum(result)/50 % 94.37 procent correct

%% 

load('numbers20_blur.mat')

