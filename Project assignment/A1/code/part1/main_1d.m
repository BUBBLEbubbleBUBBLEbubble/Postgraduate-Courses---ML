%{
  ML PA1 - 1d _ outlies and robustity analysis
  Wang Yue
  2020.10.3
%}
clear;  clc; 
close all

load('poly_data.mat');

% add 5 outliers data-----------
sampx = [sampx,-1, -0.5, 0, 0.5, 1];
sampy = [sampy;30; 20; 10; -10; -20];

samplesize = length(sampx);

%LS---------------------------------
theta = LS(sampx ,sampy ,samplesize, 5);
plotLS(sampx ,sampy ,theta ,5);

%RLS--------------------------------
lambdaRLS = 0.5;
theta = RLS(sampx ,sampy ,samplesize, 5, lambdaRLS);
plotRLS(sampx ,sampy ,theta ,5);

%LASSO------------------------------
lambdaLASSO = 0.1;
theta = LASSO(sampx ,sampy ,samplesize, 5, lambdaLASSO);
plotLASSO(sampx ,sampy ,theta ,5);

%RR---------------------------------
theta = RR(sampx ,sampy ,samplesize, 5);
plotRR(sampx ,sampy ,theta ,5);

%BR---------------------------------
alpha = 1;
sigma_square = 10;
[miu, sigma] = BR(sampx ,sampy ,samplesize, 5, alpha, sigma_square);
plotBR(sampx ,sampy ,miu, sigma ,5);

