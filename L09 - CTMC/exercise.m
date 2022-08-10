clc; close all; clear all;
MTTF1=10;
MTTF2=20;
MTTR1=2;
MTTR2=3;

l1=1/MTTF1;
l2=1/MTTF2;
m1=1/MTTR1;
m2=1/MTTR2;

Q=[-l1-l2, l1    , l2   ,0;
    m1   , -m1-l2, 0    ,l2;
    m2   ,  0    ,-m2-l1,l1;    
    0    , m2    , m1   ,-m2-m1];

p0=[0.25,0.25,0.25,0.25]
[t,sol]=ode45(@(t,x) Q'*x, [0 20], p0');
plot(t,sol,"-")





