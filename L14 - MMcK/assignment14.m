clc; close all; clear;
%% assignment 14 M/M/1/6
k=6;
lambda=0.9;
D=1;
mu=1/D;
rho=lambda/mu;

% prob of jobs in system
p0= (1-rho)/(1-rho^(k+1)); %slide 22 L14
p_4jobs=p0*rho^4;

% number of jobs in system
N=rho/(1-rho)- ((k+1)*rho^(k+1))/(1-rho^(k+1));  %slide 23 L14

% utilization
avgUtilization=(rho-rho^(k+1))/(1-rho^(k+1));  %slide 23 L14

%loss prob
LossProb=(rho^k-rho^(k+1))/(1-rho^(k+1)); %slide 24 L14

%drop rate
DropRate=lambda*LossProb;

%throughput
x=lambda-DropRate;

R=N/x;
Theta=R-D;

%% comparison M/M/1
avgUtilization_MM1=rho;
p_4jobs_MM1=(1-rho)*rho^4;
N_MM1=rho/(1-rho);
R_MM1=1/(mu-lambda);
x_MM1=N_MM1/R_MM1;
Theta_MM1=R_MM1-D;
DropRate_MM1=0;  % based on the property of M/M/1 we have no drops.

%% M/M/2/6

c=2;
k=6;
lambda_MM26=1.8;
rho=lambda_MM26/(c*mu);

% probability %slide 26 L14
p0_MM26=1/(((((c*rho)^c)/(factorial(c)))*(1-rho^(k-c+1))/(1-rho))+1+(c*rho)/1);  %ino motmaen nistam
p1=p0_MM26/factorial(1)*(lambda_MM26/mu)^1;
p2=p0_MM26/factorial(2)*(lambda_MM26/mu)^2;
p3=p0_MM26/(factorial(c)*c^(3-c))*(lambda_MM26/mu)^3;
p4=p0_MM26/(factorial(c)*c^(4-c))*(lambda_MM26/mu)^4;
p5=p0_MM26/(factorial(c)*c^(5-c))*(lambda_MM26/mu)^5;
p6=p0_MM26/(factorial(c)*c^(6-c))*(lambda_MM26/mu)^6;

% utilization of the system
Utilization_MM26=p1+2*p2+c*(p3+p4+p5+p6); %slide 27 L14
avgUtilization_MM26=Utilization_MM26/c;

%Avg number of jobs in system
N_MM26=p1+2*p2+3*p3+4*p4+5*p5+6*p6;  %slide 27 L14

% Drop rate
DropRate_MM26=lambda_MM26*p6;
x_MM26=lambda_MM26-DropRate_MM26;

%response time
R_MM26=N_MM26/x_MM26;
Theta_MM26=R_MM26-D;



