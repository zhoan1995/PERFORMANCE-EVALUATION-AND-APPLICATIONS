clc; close all; clear;
%% assignment 10
mu1=1/10;
mu2=1/5;
lambda1=1/16;
lambda2=1/12;
Q11= -lambda1-lambda2;
Q22= -mu1-lambda2;
Q33=-mu2-lambda1;
Q44=-mu2-mu1;
Q=[Q11, lambda1 , lambda2, 0      ;
   mu1,    Q22  , 0      , lambda2;
   mu2,    0    , Q33    , lambda1;
   0  ,    mu2  , mu1    , Q44   ];
sigma=[0 , 1 , 1 ,0;
       0 , 0 , 0 ,1;
       0 , 0 , 0 ,1;    
       0 , 0 , 0 ,0];

p0= [ 1 , 0 , 0 , 0 ];
alpha_U= [ 1 , 1 , 1 , 0 ];
alpha_N= [ 2 , 1 , 1 , 0 ];
time_s=200;
[t,sol]=ode45(@(t,x) Q'*x, [0 time_s], p0'); 

Utilization=sol(end,:)*alpha_U';  % utilization
Number_jobs=sol(end,:)*alpha_N';  % avg number of jobs

%% throughput
X=size(sol,1)/time_s 
%% number of jobs in different amount of time
[t,sol]=ode45(@(t,x) Q'*x, [0 10], p0'); 
N10=sol(end,:)*alpha_N';

[t,sol]=ode45(@(t,x) Q'*x, [0 20], p0'); 
N20=sol(end,:)*alpha_N';

[t,sol]=ode45(@(t,x) Q'*x, [0 50], p0'); 
N50=sol(end,:)*alpha_N';

[t,sol]=ode45(@(t,x) Q'*x, [0 100], p0'); 
N100=sol(end,:)*alpha_N';
Utilization
Number_jobs
N10
N20
N50
N100




