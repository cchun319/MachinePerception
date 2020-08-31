function g = gaussian2d(Sigma, len)
% GAUSSIAN2D - make discrete normalized centered 2D Gaussian
%
% Syntax: g = gaussian2d(Sigma, len);
%
% Output is symmetric with unit sampling period.
% (0,0) is sampled only when len is odd.
%
% Inputs:
%   Sigma: 2x2 covariance matrix
%   len: output is len x len.
%

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%
n = -(len-1)/2: (len-1)/2;
g = zeros(len,len);
for i = 1 : len
    for j = 1: len
        g(i,j) = exp(-0.5 * [n(j), n(i)] * inv(Sigma) * [n(j);n(i)])...
            / (2* pi * sqrt(det(Sigma)));
    end
end

g = g / sum(g(:));

end
% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%