function [miu, sigma] = BRa(x ,y, alpha, sigma_square)
% x is the input set; 
% y is the output set;

q = 9-1;
b = y;

A = x;

sigma = inv((1/alpha)*eye(q+1) + (1/sigma_square)*(A*A'));
miu = (1/sigma_square)*sigma*A*b; 
end