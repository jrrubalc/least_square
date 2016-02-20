%
% This code fits g(x) = b1*g1(x)+b2*g2(x)+b3*g3(x) to the data
% where g1, g2, g3,... are functions given below:
% g1(x) = 1			for x in [0, 2*pi].
% g2(x) = sin(x)		for x in [0, 2*pi].
% g3(x) = cos(x)		for x in [0, 2*pi].
%
clear
figure(1)
clf reset
axes('position',[0.15,0.13,0.75,0.75])
%
load data5.txt
x=data5(:,1);
y=data5(:,2);
%
g1=ones(size(x));
g2=sin(x);
g3=cos(x);
G=[g1, g2, g3];
%
GG=G'*G;
Gy=G'*y;
b=GG\Gy;
%
xp=2*pi*[0:0.01:1];
g=b(1)+b(2)*sin(xp)+b(3)*cos(xp);
plot(xp,g,'b-','linewidth',2.0)
hold on
plot(x,y,'ko','markerfacecolor',[0.5,0.5,0.5])
axis([0,6.5,-1.0,3.0])
set(gca,'xtick',[0:1:6])
set(gca,'ytick',[-1:1:3])
set(gca,'fontsize',14)
xlabel('x')
ylabel('y')
h1=legend('Least square fitting','data',1);
set(h1,'fontsize',12)
title('g(x) = b1+b2*sin(x)+b3*cos(x)')
%
%
