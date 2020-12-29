function theta = RRb(x ,y, feature)

% x is the input set; 
% y is the output set;

q = 9-1;
b = y;
n = length(x);
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
%Transform the program into a standard linear program
f = [zeros(q+1,1);ones(n,1)];
B = [-A',-eye(n);A',-eye(n)];
c = [-b;b];
target = linprog(f,B,c); 
theta = target(1:(q+1),:);

end