%{
  ML PA1 - 1e _ higher order estimation
  Wang Yue
  2020.10.3
%}
clear;  clc; 
close all
load('poly_data.mat');

highorder = 10; %order

%LS---------------------------------
theta1 = LS(sampx ,sampy ,50, highorder);
plotLS(sampx ,sampy ,theta1 ,highorder);

%RLS--------------------------------
lambdaRLS = 10;
theta2 = RLS(sampx ,sampy ,50, highorder, lambdaRLS);
plotRLS(sampx ,sampy ,theta2 ,highorder);

%LASSO------------------------------
lambdaLASSO = 1.8;
theta3 = LASSO(sampx ,sampy ,50, highorder, lambdaLASSO);
plotLASSO(sampx ,sampy ,theta3 ,highorder);

%RR---------------------------------
theta4 = RR(sampx ,sampy ,50, highorder);
plotRR(sampx ,sampy ,theta4 ,highorder);

%BR---------------------------------
alpha = 0.1;
sigma_square = 1;
[miu, sigma] = BR(sampx ,sampy ,50, highorder, alpha, sigma_square);
plotBR(sampx ,sampy ,miu, sigma ,highorder);

