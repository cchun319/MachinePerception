function E = estimateEmatrix(X1,X2)
% Estimate E matrix given a set of 
% pairs of matching *calibrated* points
% X1,X2: Nx2 matrices of calibrated points
%   i^th row of X1 matches i^th row of X2

% Kronecker products
% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

X11 = [X1, ones(size(X1,1),1)];
X22 = [X2, ones(size(X2,1),1)];
a = [X11(:,1) .* X22, X11(:,2).* X22, X11(:,3).*X22 ]; % Kronecker products of points in C1 and C2

[U,S,V] = svd(a);

E = reshape(V(:,9),3,3); % extract E' from V matrix

[U1, S1, V1] = svd(E);
% Project E on the space of essential matrices

E = U1*diag([1,1,0])* V1';
% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
