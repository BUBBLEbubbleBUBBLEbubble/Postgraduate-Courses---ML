function theta = LSb(x ,y, feature)

% x is the input set; 
% y is the output set;

switch feature
    case 1
        A = featuretrans1(x);
    case 2
        A = featuretrans2(x);
    case 3
        A = featuretrans3(x);
end


theta = inv(A*(A'))*A*y;

end