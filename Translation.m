function [DP] = Translation(point)

   shifted = zeros(20);
   shifted(:, 2:20) = point(:, 1:19);
   DP = point(:, :) - shifted;
   DP = DP(:);
end

