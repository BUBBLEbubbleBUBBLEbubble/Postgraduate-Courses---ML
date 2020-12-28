%{
  ML PA1 - 1b _ regression plots and  hyperparameters tunning
  Wang Yue
  2020.10.2
%}
clear;  clc; 
close all

load('poly_data.mat');

%LS---------------------------------
theta = LS(sampx ,sampy ,50, 5);
plotLS(sampx ,sampy ,theta ,5);

%RLS--------------------------------
lambdaRLS = 0.5;
theta = RLS(sampx ,sampy ,50, 5, lambdaRLS);
plotRLS(sampx ,sampy ,theta ,5);

%LASSO------------------------------
lambdaLASSO = 0.1;
theta = LASSO(sampx ,sampy ,50, 5, lambdaLASSO);
plotLASSO(sampx ,sampy ,theta ,5);

%RR---------------------------------
theta = RR(sampx ,sampy ,50, 5);
plotRR(sampx ,sampy ,theta ,5);

%BR---------------------------------
alpha = 1;
sigma_square = 5;
[miu, sigma] = BR(sampx ,sampy ,50, 5, alpha, sigma_square);
plotBR(sampx ,sampy ,miu, sigma ,5);

