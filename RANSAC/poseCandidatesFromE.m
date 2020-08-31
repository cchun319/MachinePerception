function [transfoCandidates] = poseCandidatesFromE(E)
% Return the 4 possible transformations for an input matrix E
% transfoCandidates(i).T is the 3x1 translation
% transfoCandidates(i).R is the 3x3 rotation

transfoCandidates = repmat(struct('T',[],'R',[]),[4 1]);
% Fill in the twisted pair for E and the twisted pair for -E
% The order does not matter.

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

z_r = [0, -1, 0; % rotation along z axis for pi/2
    1, 0, 0;
    0, 0, 1];

z_r2 = [0, 1, 0; % rotation along z axis for -pi/2
    -1, 0, 0;
    0, 0, 1];

[U,S,V] = svd(E);
T1_hat = U*z_r*S*U';
R1 = U*z_r*V';

T2_hat = U*z_r2*S*U';
R2 = U*z_r2*V';

T1 = [-T1_hat(2,3),T1_hat(1,3),-T1_hat(1,2)]'; % extract translation from hat operator
T2 = [-T2_hat(2,3),T2_hat(1,3),-T2_hat(1,2)]';

transfoCandidates(1).T = T1;
transfoCandidates(1).R = R1;
transfoCandidates(2).T = T2;
transfoCandidates(2).R = R2;
transfoCandidates(3).T = T1;
transfoCandidates(3).R = R2;
transfoCandidates(4).T = T2;
transfoCandidates(4).R = R1;

% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%