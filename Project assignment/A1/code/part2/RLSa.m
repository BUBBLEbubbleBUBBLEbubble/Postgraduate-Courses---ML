function theta = RLSa(x ,y, lambda)

% x is the input set; 
% y is the output set;

A = x;

theta = inv((A*(A'))+ lambda.*eye(9))*A*y;

end