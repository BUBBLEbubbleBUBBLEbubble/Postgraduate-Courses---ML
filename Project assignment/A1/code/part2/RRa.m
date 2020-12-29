function theta = RRa(x ,y)

% x is the input set; 
% y is the output set;

q = 9-1;
b = y;
n = length(x);

A = x;

%Transform the program into a standard linear program
f = [zeros(q+1,1);ones(n,1)];
B = [-A',-eye(n);A',-eye(n)];
c = [-b;b];
target = linprog(f,B,c); 
theta = target(1:(q+1),:);

end