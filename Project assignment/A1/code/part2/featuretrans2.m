function [A] = featuretrans2(x)

% trans(x) = [x1,x2,x3,...x1x2,x1x3,x2x3,...x1^2,x2^2,x3^2...]T

A = x;

for i = 1:9
    for j = i:9
        temp = x(i,:).*x(j,:);
        A = [A;temp];
    end
    
end

end