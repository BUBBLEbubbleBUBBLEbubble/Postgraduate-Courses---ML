function plotLASSOb(theta, feature)

base = linspace(1,600,600);

load('count_data.mat');
MSE = 0;
MAE = 0;
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
for j = 1 : count
    yy(j) = (input(:,j))'*theta;
    MSE = MSE + (yy(j)-testy(j))^2;
    MAE = MAE + abs(yy(j)-testy(j));
end
MSE = MSE/count;
MAE = MAE/count;

%----------------------------
figure(3)
plot(base,testy,'*',base,yy,'*')
legend({'true counts','predictions'},'Location','northeast')
title('L1-regularized LS (LASSO)');
fprintf('The value of MSE in L1-regularized LS (LASSO) is: %f\n',MSE);
fprintf('The value of MAE in L1-regularized LS (LASSO) is: %f\n',MAE);

end