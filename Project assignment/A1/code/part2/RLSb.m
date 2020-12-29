function theta = RLSb(x ,y, lambda,feature)

% x is the input set; 
% y is the output set;
%------------------------
switch feature
    case 1
        A = featuretrans1(x);
        I = 18;
    case 2
        A = featuretrans2(x);
        I = 54;
    case 3
        A = featuretrans3(x);
        I = 9;
%         I = 18;
end
%------------------------

theta = inv((A*(A'))+ lambda.*eye(I))*A*y;

end