function [ DP ] = Rotation( point )

    pointRot = imrotate(point,5,'bilinear','crop');

    DP = point - pointRot;
    DP = DP(:);
end

