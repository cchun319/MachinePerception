function [filter_cos,filter_sin] = gaborFilter2D(T_f, theta, Sigma, len)
% This function returns two 2D Gabor quadrature filters
% (square matrices).
%
% ARGUMENTS
% - T_f: spatial period in pixels
% - theta: carrier orientation in degrees (0 corresponds
% to oscillation along x-axis only)
% - Sigma: covariance of Gaussian envelope
% - len: output is len x len.
%
% OUTPUT
% filter_cos, filter_sin: two 2d matrices containing the real part
% and the imaginary part of the filter

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%
% use gaussian2d.m
phi = theta / 180 * pi;

g = gaussian2d(Sigma, len);

n = -(len-1)/2 : (len-1)/2;
an = 2*pi/T_f *( n * cos(phi) - n'*sin(phi));

filter_cos = g .* cos(an);
filter_sin = g .* sin(an);


end 
% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%

