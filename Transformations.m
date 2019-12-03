function [ transformationMatrix ] = Transformations(inPictures )
% inPictures(x, y, picture_id)

    e = ones(20, 1);
    X = -9:1:10;
    Y = -9:1:10;
    X = e*X;
    Y = e*Y;
    transformationMatrix = zeros(size(inPictures, 1)^2, 1, length(inPictures));
%     for i = 1:length(inPictures)    
%         transformationMatrix(:,1,i) = TranslationX(inPictures(:,:,i));
%         transformationMatrix(:,2,i) = TranslationY(inPictures(:,:,i));
% %         transformationMatrix(:,3,i) = Rotation(inPictures(:,:,i));
% %         transformationMatrix(:,4,i) = Scaling(inPictures(:,:,i));
% %         transformationMatrix(:,5,i) = Smalling(inPictures(:,:,i));
%         
%     end 
    [Px,Py] = TranslationX(inPictures); 
    XPx = X.*Px(1:20, 1:20, :);
    YPx = Y.*Px(1:20, 1:20, :);
    XPy = X.*Py(1:20, 1:20, :);
    YPy = Y.*Py(1:20, 1:20, :);
    
    for i = 1:length(inPictures)  
        Px_current = Px(:, :, i); 
        Py_current = Px(:, :, i);
        
        XPx_current = XPx(:, :, i);
        YPx_current = YPx(:, :, i);
        XPy_current = XPy(:, :, i);
        YPy_current = YPy(:, :, i);
        
        transformationMatrix(:, 1, i) = Px_current(:);
        transformationMatrix(:, 2, i) = Px_current(:); 
        %TODO: the rest
    end
    
end

