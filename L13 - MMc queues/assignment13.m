clc; close all; clear;
%% assignment 13
%% M/M/2
lambda=0.95;
D_MM2=1.8; %s
mu_MM2=1/D_MM2;
rho_MM2=lambda/(2*mu_MM2);

% utilization of the system
avgUtilization_MM2=rho_MM2; %%slide 25 L13

% prob of having exactly 1 job in system
%p_1jobs_MM2=(2*mu_MM2-lambda)/(2*mu_MM2+lambda); %slide 22 L13

% prob of having exactly 4 jobs in system
p_4jobs_MM2=2*(rho_MM2^4)*(1-rho_MM2)/(1+rho_MM2);
%2*p_1jobs_MM2*((lambda/(2*mu_MM2))^4); %slide 22 L13

%Avg number of jobs in system
N_MM2=(2*rho_MM2)/(1-(rho_MM2^2));

%response time
R_MM2=D_MM2/(1-(rho_MM2^2));    %slide 27 L13

%average time spent in the queue
AvgQueueLength_MM2=R_MM2-D_MM2; 

%% M/M/1
lambda=0.95;
D=0.9; %ms
mu=1/D;
rho=lambda/mu;

% utilization of the system
avgUtilization=rho;

% prob of having exactly 4 jobs in system
p_4jobs=(1-(lambda/mu))*((lambda/mu)^4);  %slide 32 L12

%Avg number of jobs
N=rho/(1-rho);

%response time
R=1/(mu-lambda);    %slide 32 L12

%average time spent in the queue
AvgQueueLength=R-D; 

%% M/M/3
D_MM3=2.7;
mu_MM3=1/D_MM3;
rho_MM3=lambda/(3*mu_MM3);

% utilization of the system
avgUtilization_MM3=rho_MM3; %%slide 30 L13

% prob of having exactly 1 job in system
p_1jobs_MM3=1/(((4.5*rho_MM3^3)/(1-rho_MM3))+1+3*rho_MM3+4.5*(rho_MM3^2)); %slide 30 L13

% prob of having exactly 4 jobs in system
p_4jobs_MM3=3^3*(rho_MM3^4)*p_1jobs_MM3/factorial(3);  %slide 30 L13

%Avg number of jobs
N_MM3=3*rho+(rho_MM3/(1-rho_MM3))/(1+((1-rho_MM3)*(6/(27*rho_MM3^3)))*(+1+3*rho_MM3+4.5*(rho_MM3^2)));

%average time spent in the queue  %slide 31 L13
AvgQueueLength_MM3=(D_MM3/(3*(1-rho_MM3)))/(1+((1-rho_MM3)*(6/(27*rho_MM3^3)))*(+1+3*rho_MM3+4.5*(rho_MM3^2)));

%response time
R_MM3=D_MM3+AvgQueueLength_MM3;    %slide 31 L13

%% M/M/00

rho_MM=lambda/(mu_MM3);

% prob of having exactly 4 jobs in system
p_4jobs_MM=exp(-rho_MM)*(rho_MM^4)/24;  %slide 39 L13

%Avg number of jobs
N_MM=lambda*D_MM3;  %slide 35 L13

%average time spent in the queue  %slide 31 L13
AvgQueueLength_MM=0;

%response time
R_MM=D_MM3;    %slide 31 L13


