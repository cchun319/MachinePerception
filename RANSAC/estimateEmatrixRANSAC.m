function [E, bestInliers] = estimateEmatrixRANSAC(X1,X2)
% Estimate E matrix given a set of
% pairs of matching *calibrated* points
% X1,X2: Nx2 matrices of calibrated points
%   i^th row of X1 matches i^th row of X2
%
% E: robustly estimated E matrix
% bestInliers: indices of the rows of X1 (and X2) that where in the
% largest consensus set

nIterations = 10000;
sampleSize = 8;

%fractionInliers = 0.6;
%nInliers = floor((size(X1,1) - sampleSize) * fractionInliers);
%bestError = Inf;
eps = 10^(-5);
bestNInliers = 0;

X1 = [X1, ones(size(X1,1),1)];
X2 = [X2, ones(size(X2,1),1)];


for i=1:nIterations
    rr = zeros(size(X1,1),1);

    indices = randperm(size(X1,1));
    sampleInd = indices(1:sampleSize);
    testInd =  indices(sampleSize+1:length(indices));
    % Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x1_s = X1(sampleInd,1:2);
    x2_s = X2(sampleInd,1:2);
    
    E_sample = estimateEmatrix(x1_s, x2_s);
    
%     X1_r = X1(testInd,:);
%     X2_r = X2(testInd,:);
    X1_r = X1(:,:);
    X2_r = X2(:,:);
    
    l1 = X2_r * E_sample; % epiline1
    l2 = (E_sample * X1_r')'; % epiline2
    
    e3 = [0, -1, 0;
        1, 0, 0;
        0, 0, 0];
    
    d1 = sum((X1_r .* l1),2).^2 ./ sum((l1 * e3').^2,2); % vectorized distance to epi line
    d2 = sum((X2_r .* l2),2).^2 ./ sum((l2 * e3').^2,2);
    
    residuals = d1 + d2;

%     rr(testInd,:) = residuals;
    rr = residuals;
    [curInliers,~] = find(rr < eps);          
    
    % End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    curNInliers = length(curInliers);
    
    if curNInliers > bestNInliers
        bestNInliers = curNInliers;
        bestInliers = curInliers;
        E = E_sample;
    end
end

disp(['Best number of inliers: ' num2str(bestNInliers) '/' num2str(size(X1,1))]);
