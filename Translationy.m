function [transformationVector] = TranslationY(inPicture)
   transformationVector = inPicture;
   transformationVector(2:20, :) =- inPicture(1:19, :);
   transformationVector = transformationVector(:);
end

