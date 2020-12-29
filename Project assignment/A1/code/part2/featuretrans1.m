function [A] = featuretrans1(x)

% phi(x) = [x1,x2,x3...,x1^2,x2^2,x3^2...]T

B = x;
C = x.^2;
A = [B;C];
