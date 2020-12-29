%{
  ML PA1 - 2a _ Original feature set analysis
  Wang Yue
  2020.10.4
%}

clear;
load('count_data.mat');

% LS-----------------------
theta = LSa(trainx,trainy);
plotLSa(theta);

% RLS----------------------
lambda = 0.9;
theta = RLSa(trainx, trainy, lambda);
plotRLSa(theta);

% LASSO----------------------
lambda = 4;
theta = LASSOa(trainx, trainy, lambda);
plotLASSOa(theta);

% RR----------------------
theta = RRa(trainx,trainy);
plotRRa(theta);

% BR----------------------
alpha = 5;
sigma_square = 5;
[miu, sigma] = BRa(trainx, trainy, alpha, sigma_square);
plotBRa(miu, sigma);








