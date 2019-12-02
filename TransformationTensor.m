function [ bread ] = TransformationTensor(pointTensor )

    bread = zeros(size(pointTensor, 1)^2,1, length(pointTensor));
    for i = 1:length(pointTensor)    
        bread(:,1,i) = Translation(pointTensor(:,:,i));
        bread(:,2,i) = Translationy(pointTensor(:,:,i));
        bread(:,3,i) = Rotation(pointTensor(:,:,i));
        bread(:,4,i) = Scaling(pointTensor(:,:,i));
        bread(:,5,i) = Smalling(pointTensor(:,:,i));
        
    end 
end

