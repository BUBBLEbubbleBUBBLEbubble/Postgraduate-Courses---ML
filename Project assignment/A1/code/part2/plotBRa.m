function plotBRa(miu, sigma)

load('count_data.mat');
base = linspace(1,600,600);
count = length(testy);
q = 9-1;
P = testx;
%----------------------
MSE = 0;
MAE = 0;
for j = 1 : count
    mius(j) = P(:,j)'*miu;
    sigmas(j) = P(:,j)'*sigma*P(:,j);
    yy(j) = mius(j);
    yymax(j) = mius(j) + sigmas(j);
    yymin(j) = mius(j) - sigmas(j);
    MSE = MSE + (yy(j)-testy(j))^2;
    MAE = MAE + abs(yy(j)-testy(j));
end
MSE = MSE/count;
MAE = MAE/count;
%-------------------
fprintf('The value of MSE in Bayesian Regression is: %f\n',MSE);
fprintf('The value of MAE in Bayesian Regression is: %f\n',MAE);

figure(5)
plot(base,testy,'*',base,yy,'r*',base,yymax,'g',base,yymin,'b')
legend({'true counts','prediction(BR)','+1\sigma-function',' -1\sigma-function'},'Location','northeast')
title('Bayesian regression (BR)');

end