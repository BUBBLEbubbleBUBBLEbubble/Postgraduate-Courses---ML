load birdtruth_rectspace.txt
correct = birdtruth_rectspace;
[m,n]=size(correct);
c = zeros(m,2);
c(:,1) = correct(:,1) + correct(:,3)/2;
c(:,2) = correct(:,2) + correct(:,4)/2;

s = zeros(m,2);

load tic_x_bird.mat
load tic_y_bird.mat
s(:,1)= tic_x_bird(2:m+1,1);
s(:,2)= tic_y_bird(2:m+1,1);

error=zeros(1,m);
error = sqrt  (   (c(:,1)-s(:,1)).^2 + (c(:,2)- s(:,2)).^2   ) ;
i=1:m;
plot(i,error);
axis([0,98,0,60]);
xlabel('Iteration');
ylabel('Euclides distance');
title('The error of center between tracking results and true data');