correct=load('sequences\Dog\dogtruth_rectspace.txt');
% load sequences\Dog\dogtruth_rectspace.txt
% correct = dogtruth_rectspace; 
[m,n]=size(correct);
c = zeros(m,2);
c(:,1) = correct(:,1) + correct(:,3)/2;
c(:,2) = correct(:,2) + correct(:,4)/2;

s = zeros(m,2);
load positionsDog;
s(:,1)= positionsDog(:,2);
s(:,2)= positionsDog(:,1);

error=zeros(1,m);
error = sqrt  (   (c(:,1)-s(:,1)).^2 + (c(:,2)- s(:,2)).^2   ) ;
i=1:m;
plot(i,error);
axis([ 1 ,127 , 0 , 60]);
xlabel('Iteration');
ylabel('Euclides distance');
title('The error of center between tracking results and true data');
