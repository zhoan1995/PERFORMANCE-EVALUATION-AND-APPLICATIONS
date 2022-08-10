%% slide 30- L10
clc; close all; clear all;
% MTTF1=10;
% MTTF2=20;
% MTTR1=2;
% MTTR2=3;
% 
% l1=1/MTTF1;
% l2=1/MTTF2;
% m1=1/MTTR1;
% m2=1/MTTR2;

Q=[0 , 1 , 1 ,0;
   0 , 0 , 0 ,1;
   0 , 0 , 0 ,1;    
   0 , 0 , 0 ,0];  % absorbing state
% Q_prime=[ones(4,1), Q(:,2:4)];  %slide 11 pdf 10
% pi=[1 0 0 0]*inv(Q_prime) ;         %slide 11 pdf 10
p0= [ 1 , 0 , 0 , 0 ];
[t,sol]=ode45(@(t,x) Q'*x, [0 200], p0');
plot(t,sol,"-")





