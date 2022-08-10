clc; close all; clear all;
%% assignment 9
MTTF=100;
MTTR=5;
MTTbackUp=15;

l=1/MTTF;
m=1/MTTR;
b=1/MTTbackUp;

Q=[ -2*l    , l     , l    ,0;       % Infinitesimal generator
    m       , -m-l    , 0    ,l;
    m       , 0    ,-m-l  ,l;    
    b       , 0    , 0   ,-b];

p0=[1,0,0,0];
[t,sol]=ode45(@(t,x) Q'*x, [0 10000], p0');
plot(t,sol,"-");
legend('s1','s2','s3','s4');
SteadyStateProbabilities=[sol(2793,:)];
figure
set(gca, 'YScale', 'log')
%plot(log10(t),log10(sol),"-");
semilogy(t,sol,"-");
xlim([0 10]);



