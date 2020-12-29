function [A] = featuretrans3(x)

% phi(x) = tanh

A = tanh(x);

% A = x;
% x1 = tanh(x);
% x2 = tanh(x.^2);
% x3 = tanh(x.^3);
% x4 = tanh(x.^4);
% x5 = tanh(x.^5);
% x6 = tanh(x.^6);
% A = [A;tanh(x)];
% A = [x;x1;x2;x3;x4;x5;x6];
