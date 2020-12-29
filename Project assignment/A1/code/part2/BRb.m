function [miu, sigma] = BRb(x ,y, alpha, sigma_square,feature)
% x is the input set; 
% y is the output set;

b = y;
%------------------------
switch feature
    case 1
        A = featuretrans1(x);
        q = 18-1;
    case 2
        A = featuretrans2(x);
        q = 54-1;
    case 3
        A = featuretrans3(x);
        q = 9-1;
%         q = 18-1;
end
%------------------------
sigma = inv((1/alpha)*eye(q+1) + (1/sigma_square)*(A*A'));
miu = (1/sigma_square)*sigma*A*b; 
end