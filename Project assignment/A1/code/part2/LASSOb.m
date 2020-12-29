function theta = LASSOb(x, y, lambda, feature)
% x is the input set; 
% y is the output set;

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

b = y;
% Set quadprog parameter
H = [A*(A'), -A*(A'); -A*(A'), A*(A')];
f = lambda*ones(2*q+2,1) - [A*b;-A*b];
B = -eye(2*q+2);
c = zeros(2*q+2,1);
target = quadprog((H+H')/2,f,B,c);
thetaM = target(1:q+1,:);
thetaN = target(q+2:end,:);
theta = thetaM - thetaN;

end