function theta = LSa(x ,y)

% x is the input set; 
% y is the output set;


A = x;

theta = inv(A*(A'))*A*y;

end