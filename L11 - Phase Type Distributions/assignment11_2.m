clc; close all; clear;
%% assignment 11
alphaComputing=[1, 1, 0, 0, 0, 0, 0];
alphaWifi=[0, 0, 1, 1, 0, 0, 0];
alpha4G=[0, 0, 0, 0, 1, 1, 1];

A1A2=5*0.3*0.75; %slide 20
A1B2=5*0.3*0.25;
A1C1=5*0.7;
B1A2=10*0.3*0.75;
B1B2=10*0.3*0.25;
B1C1=10*0.7;
A2A1=1*0.4;
A2B1=1*0.6;
B2A1=0.2*0.4;
B2B1=0.2*0.6;
C1C2=8;
C2C3=8;
C3A1=8*0.4;
C3B1=8*0.6;

Q=[-A1A2-A1B2-A1C1, 0, A1A2, A1B2,A1C1, 0,0;
   0,-B1A2-B1B2-B1C1 , B1A2,B1B2,B1C1,0,0;
   A2A1,A2B1,-A2A1-A2B1,0,0,0,0;
   B2A1,B2B1,0,-B2A1-B2B1,0,0,0;
   0,0,0,0,-C1C2,C1C2,0;
   0,0,0,0,0,-C2C3,C2C3;
   C3A1,C3B1,0,0,0,0,-C3A1-C3B1;
   ];

p0=[0.4,0.6,0,0,0,0,0]; 

sigma=[
0, 0, 0, 0, 0, 0, 0; 
0, 0, 0, 0, 0, 0, 0;  
1, 1, 0, 0, 0, 0, 0;  
1, 1, 0, 0, 0, 0, 0;  
0, 0, 0, 0, 0, 0, 0;  
0, 0, 0, 0, 0, 0, 0;  
1, 1, 0, 0, 0, 0, 0;  
];

[t,sol]=ode45(@(t,x) Q'*x, [0 100], p0'); 
p_computing=sol(end,:)*alphaComputing';
P_wifi=sol(end,:)*alphaWifi';
P_4G=sol(end,:)*alpha4G';

Qsigma=(Q.*sigma);
sigmaVect=sum(Qsigma,2);

x=sol(end,:)* sigmaVect;


