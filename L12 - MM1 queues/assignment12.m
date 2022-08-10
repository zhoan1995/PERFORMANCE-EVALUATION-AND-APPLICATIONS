clc; close all; clear;
%% assignment 12 

lambda=10;
D=0.085; %ms
mu=1/D;
rho=lambda*D;
t=0.5;
% utilization of the system
avgUtilization=rho;

% prob of having exactly 1 job in system
p_1jobs_MM1=(1-(lambda/mu))*(lambda/mu);  %slide 32 L12

% prob of having more than 5 jobs in system
ProbMore5Jobs=rho^6;    %slide 34 L12

%response time
R=1/(mu-lambda);    %slide 32 L12

%average time spent in the queue
AvgQueueLength=(R-D); 
AvgQueueLength2=(rho*D)/(1-rho);

% prob of response time be greater than 0.5 s
ProbResponseTime=exp(-(t/R));

%90 percentile of response time.
percentile_90=-log(1-0.9)*R;

% %%
% lambda=0.95;
% D=1.8; %ms
% mu=1/D;
% rho=lambda/mu;
% 
% % utilization of the system
% avgUtilization=rho;
% 
% % prob of having exactly 4 jobs in system
% p_4jobs=(1-(lambda/mu))*((lambda/mu)^4);  %slide 32 L12
% 
% %Avg number of jobs
% N=rho/(1-rho);
% 
% %response time
% R=1/(mu-lambda);    %slide 32 L12
% 
% %average time spent in the queue
% AvgQueueLength=R-D; 







