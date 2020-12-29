%{
  ML PA1 - 2b _ Other feature transformation 3
  % phi(x) = tanh(x)
  Wang Yue
  2020.10.4
%}

clear;
load('count_data.mat');
featuretrans = 3;% 1/2/3 which means 3 different feature transformation

% LS-----------------------
theta = LSb(trainx, trainy, featuretrans);
plotLSb(theta, featuretrans);

% RLS----------------------
lambda = 0.6;
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
alpha = 10;
sigma_square = 1;
[miu, sigma] = BRb(trainx, trainy, alpha, sigma_square, featuretrans);
plotBRb(miu, sigma, featuretrans);



