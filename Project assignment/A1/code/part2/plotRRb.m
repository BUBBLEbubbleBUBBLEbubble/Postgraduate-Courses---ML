function plotRRb(theta, feature)

base = linspace(1,600,600);

load('count_data.mat');
count = length(testy);
%----------------------------
switch feature
    case 1
        input = featuretrans1(testx);
    case 2
        input = featuretrans2(testx);
    case 3
        input = featuretrans3(testx);
end
%----------------------------
MSE = 0;
MAE = 0;
for j = 1 : count
    yy(j) = (input(:,j))'*theta;
    MSE = MSE + (yy(j)-testy(j))^2;
    MAE = MAE + abs(yy(j)-testy(j));
end
MSE = MSE/count;
MAE = MAE/count;
%----------------------------
figure(4)
plot(base,testy,'*',base,yy,'*')
legend({'true counts','predictions(RR)'},'Location','northeast')
title('Robust Regression (RR)');
fprintf('The value of MSE in robust regression (RR) is: %f\n',MSE);
fprintf('The value of MAE in robust regression (RR) is: %f\n',MAE);

end