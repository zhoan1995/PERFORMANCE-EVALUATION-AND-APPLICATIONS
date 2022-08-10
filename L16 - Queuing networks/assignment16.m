clc; close all; clear;
%% assignment 16

lambda=10;
%demand based on the seconds
d1=85*10^(-3);
d2=75*10^(-3);
d3=50*10^(-3);

%utilization of the 3 states
u1=lambda*d1;   %slide 57 L16
u2=lambda*d2;
u3=lambda*d3;

%avg number of jobs
n1=u1/(1-u1);   %slide 57 L16
n2=u2/(1-u2);
n3=u3/(1-u3);

%avg response time
r1=d1/(1-u1);   %slide 57 L16
r2=d2/(1-u2);
r3=d3/(1-u3);

avgResponseTime=r1+r2+r3;


