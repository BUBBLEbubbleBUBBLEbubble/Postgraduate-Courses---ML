%{
  ML PA1 - 1c _ sample subsets and learning curves
  Wang Yue
  2020.10.3
%}
clear;  clc; 
close all

load('poly_data.mat');

% randomly sample data-----------
sample = [sampx;sampy'];

datasize = length(sampx);
samplesize = round(0.75*datasize);  %£¨10/25/50/75 percent£©

sample_ = sample(:,randperm(datasize, samplesize));

sampx = sample_(1,:);
sampy = (sample_(2,:))';

%LS---------------------------------
theta = LS(sampx ,sampy ,samplesize, 5);
plotLS(sampx ,sampy ,theta ,5);

%RLS--------------------------------
lambdaRLS = 10;
theta = RLS(sampx ,sampy ,samplesize, 5, lambdaRLS);
plotRLS(sampx ,sampy ,theta ,5);

%LASSO------------------------------
lambdaLASSO = 2;
theta = LASSO(sampx ,sampy ,samplesize, 5, lambdaLASSO);
plotLASSO(sampx ,sampy ,theta ,5);

%RR---------------------------------
theta = RR(sampx ,sampy ,samplesize, 5);
plotRR(sampx ,sampy ,theta ,5);

%BR---------------------------------
alpha = 1;
sigma_square = 1;
[miu, sigma] = BR(sampx ,sampy ,samplesize, 5, alpha, sigma_square);
plotBR(sampx ,sampy ,miu, sigma ,5);

