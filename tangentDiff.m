function [ out_distance ] = tangentDiff( p, e, Tp, Te )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    A = [-Tp Te];
    b = p - e;
    b = b(:);
    
    % qr decomposition
    %[Q, R, ~] = qr(A);
    x = A\b;
    r = norm(b-A*x);
    % Get size of Q2
%     split_index = 0;
%     for i = 1:length(R)
%         if sum(R(i, :)) == 0
%             split_index = i;
%             break;
%         end       
%     end
%     % Get Q2
%     Q2 = Q(split_index:size(Q, 1), :);  
%     
    % vector to take norm of
%     diff = Q2*b;
%     
%     % Take the norm
%     diff = diff.^2;
%     residual =sum(sum(diff));
%     
    % Out
    out_distance = r;
end

