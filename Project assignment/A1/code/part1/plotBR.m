function plotBR(x ,y ,miu, sigma ,q)

load('poly_data.mat');
MSE = 0;
count = length(polyx);

for j = 1 : count
    xx(j) = polyx(j);
    mius(j) = 0;
    sigmas(j) = 0;
    for k = 1:q+1
        mius(j) = mius(j) + miu(k)*xx(j)^(k-1);
    end
    sigmas(j) = phi(xx(j), q)'*sigma*phi(xx(j),q);
    yy(j) = mius(j);
    yymax(j) = mius(j) + sigmas(j);
    yymin(j) = mius(j) - sigmas(j);
    MSE = MSE + (yy(j)-polyy(j))^2;
end
   MSE = MSE/count;
   fprintf('The value of MSE in Bayesian Regression is: %f\n',MSE);
   
   %--------------------
   figure(5)
   plot(x,y,'*',  xx,yy,'r',  xx,yymax,'g',  xx,yymin,'c',  polyx,polyy,'--k')
   legend({'samples','BR regression','+1\sigma-function',' -1\sigma-function', 'True function'},'Location','northeast')
   title('Bayesian regression (BR)');

end