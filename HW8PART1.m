%This code uses the least square method to fit polynomials of various 
%degrees to the data. 
%fit p2(x) = b1+b2*x+b3*x^2 to data6.txt. 
%fit p3(x) = b1+b2*x+b3*x^2+b4*x^3 to data6.txt. 
%fit p4(x) = b1+b2*x+b3*x^2+b4*x^3+b5*x^4 to data6.txt. 
%
clear
figure(1)
clf reset
axes('position',[0.15,0.13,0.75,0.75])
%
load data6.txt
x=data6(:,1);
y=data6(:,2);
xp=[0:0.01:1];
%
g1=ones(size(x));
g2=x;
g3=x.^2;
g4=x.^3;
g5=x.^4;


G2=[g1, g2, g3];
G3=[g1, g2, g3, g4];
G4=[g1, g2, g3, g4, g5];
%

GG2=G2'*G2;
Gy2=G2'*y;
b2=GG2\Gy2;
g2=b2(1)+b2(2)*xp+b2(3)*xp.^2;

GG3=G3'*G3;
Gy3=G3'*y;
b3=GG3\Gy3;
g3=b3(1)+b3(2)*xp+b3(3)*xp.^2+b3(4)*xp.^3;

GG4=G4'*G4;
Gy4=G4'*y;
b4=GG4\Gy4;
g4=b4(1)+b4(2)*xp+b4(3)*xp.^2+b4(4)*xp.^3+b4(5)*xp.^4;

plot(xp,g2,'b-','linewidth',2.0)
hold on
plot(xp,g3,'r-','linewidth',3.0)
plot(xp,g4,'g--','linewidth',2.0)
plot(x,y,'ko','markerfacecolor',[0.5,0.5,0.5])

axis([0,1,-1.0,3.5])
set(gca,'xtick',[0:0.2:1])
set(gca,'ytick',[-1:1:3])
set(gca,'fontsize',14)

xlabel('x')
ylabel('y')
h1=legend('polynomials of degree 2','polynomials of degree 3','polynomials of degree 4','data',4);
set(h1,'fontsize',12)
title('Figure 1: Polynomials of Various Degrees Fit to the Data.')
%
%