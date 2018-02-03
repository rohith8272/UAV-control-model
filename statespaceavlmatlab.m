%this is orginal model from AVL
%%-----Rohith M------%%
%%-----8/11/2017-----%%
clear all
close all
clc
A=[-0.0675	0.2851	0.1178	-9.8;
-1.3621	-4.2106	13.8249	0;
-0.0163	-1.2518	-4.0074	0;
0	0	1	0]
B=[	-0.446E-02;
	-0.1307;
	-0.6659;
	0]
C=[0 0 0 0;
    0 0 0 0;
    0 0 0 0;
    0 0 0 1]
D=[0;0;0;0]
sys_ss = ss(A,B,C,D);
G=tf(sys_ss)
%define variables to pull out values from G .fpr example R=G(4)
%plot the root locus
figure(1)
sgrid on;
rlocus(G(4));
title('longitudinal dynamics, G(s), Root Locus')
print('-dpng','-r300','PlantRL')
[yStepG, tStepG] = step(G(4));
%plot the step response
figure(2)
plot(tStepG,yStepG)
grid on
title('Plant Step Response','FontSize',16)
xlabel('Time, sec','FontSize',14)
ylabel('\delta\theta, rads','FontSize',14)

%obtain eigen values of state matrix
[V,Gam]=eig(A)
