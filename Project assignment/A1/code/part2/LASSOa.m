function theta = LASSOa(x, y, lambda)
% x is the input set; 
% y is the output set;

q = 9-1;
b = y;

A = x;

%-------------------
H = [A*(A'), -A*(A'); -A*(A'), A*(A')];
f = lambda*ones(2*q+2,1) - [A*b;-A*b];
B = -eye(2*q+2);
c = zeros(2*q+2,1);
target = quadprog((H+H')/2,f,B,c);
thetaM = target(1:q+1,:);
thetaN = target(q+2:end,:);
theta = thetaM - thetaN;

end