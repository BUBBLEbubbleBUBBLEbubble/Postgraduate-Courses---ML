function plotLSa(theta)

base = linspace(1,600,600);

load('count_data.mat');
count = length(testy);
input = testx;
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
figure(1)
plot(base,testy,'*',base,yy,'*')
legend({'true counts','predictions(LS)'},'Location','northeast')
title('Least-Squares (LS)');
fprintf('The value of MSE in Least-Squares (LS) is: %f\n',MSE);
fprintf('The value of MAE in Least-Squares (LS) is: %f\n',MAE);

end