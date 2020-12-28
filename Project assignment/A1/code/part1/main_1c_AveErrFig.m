%{
  ML PA1 - 1b_average error figure
  Wang Yue
  2020.10.3
%}

clear; clc;

x = [0.1,0.25,0.5,0.75];  %选择的百分比

y1 = [7509.398, 21.173, 1.752, 1.055];
y2 = [3.728, 2.288, 1.964, 1.080];
y3 = [7.611, 2.673, 1.714, 0.935];
y4 = [3320.148, 70.392, 2.120, 1.136];
y5 = [3.807, 2.710, 1.286, 1.136];

figure(1)
plot(x,y1,'r',x,y2,'g',x,y3,'b',x,y4,'',x,y5,'k')

ylim([0.1 30]);
legend({'LS','RLS','LASSO','RR','BR'},'Location','northeast')
title('MSE versus Training Size');
