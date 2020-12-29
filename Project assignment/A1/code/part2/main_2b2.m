%{
  ML PA1 - 2b _ Other feature transformation 2
  % phi(x) = [x1,x2,x3..., x1x2,x1x3,x2x3,..., x1^2,x2^2,x3^2...]
  Wang Yue
  2020.10.4
%}

clear;
load('count_data.mat');
featuretrans = 2;% 1/2/3 which means 3 different feature transformation

% LS-----------------------
theta = LSb(trainx, trainy, featuretrans);
plotLSb(theta, featuretrans);

% RLS----------------------
lambda = 0.9;
theta = RLSb(trainx, trainy, lambda, featuretrans);
plotRLSb(theta, featuretrans);

% LASSO----------------------
lambda = 4;
theta = LASSOb(trainx, trainy, lambda, featuretrans);
plotLASSOb(theta, featuretrans);

% RR----------------------
theta = RRb(trainx, trainy, featuretrans);
plotRRb(theta, featuretrans);

% BR----------------------
alpha = 5;
sigma_square = 5;
[miu, sigma] = BRb(trainx, trainy, alpha, sigma_square, featuretrans);
plotBRb(miu, sigma, featuretrans);



