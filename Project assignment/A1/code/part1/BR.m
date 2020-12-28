function [miu, sigma] = BR(x ,y ,n ,q, alpha, sigma_square)
% x is the input set; 
% y is the output set;
% n is the set size
% q is the order of polynomial
b = zeros(n,1);

for i = 1:n
   b(i) = y(i);
   for j = 1:q+1
       A(j,i) = x(i)^(j-1);
   end
end

sigma = inv((1/alpha)*eye(q+1) + (1/sigma_square)*(A*A'));
miu = (1/sigma_square)*sigma*A*b; 
end