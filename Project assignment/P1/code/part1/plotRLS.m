function plotRLS(x ,y ,theta ,q)

load('poly_data.mat');
MSE = 0;
count = length(polyx);

%polyx as inputs------------------------
for j = 1 : count
    xx(j) = polyx(j);
    yy(j) = 0;
    for k = 1:q+1
        yy(j) = yy(j) + theta(k)*xx(j)^(k-1);
    end
    MSE = MSE + (yy(j)-polyy(j))^2;
end
MSE = MSE/count;

%---------------------------------------------
        figure(2)
        plot(x,y,'*',xx,yy,'r', polyx,polyy,'--k')
        legend({'samples','RLS regression','True function'},'Location','northeast')
        title('Regularized LS (RLS)');
        fprintf('The value of MSE in Regularized LS (RLS) is: %f\n',MSE);
   
end