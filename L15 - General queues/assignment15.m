clc; close all; clear;
%% assignment 15

lambdaPois=3; %Poisson process
lambdaHyp1=1; %Hyper-Exponential
lambdaHyp2=10; %Hyper-Exponential

p1=0.2;

% avg service time 
D=p1/lambdaHyp1+(1-p1)/lambdaHyp2;

%second moment
m2=2*(p1/(lambdaHyp1.^2)+(1-p1)/(lambdaHyp2.^2));

%utilization
u1=lambdaPois*D;
disp(["U:",u1]);

%traffic intensity
rho=lambdaPois*D; %slide 16 L15

%avg number of jobs in the system
N1=rho+((lambdaPois.^2)*m2)/(2*(1-rho)); %slide 28 L15
disp(["N:",N1]);

%avg response time
R1=D+(lambdaPois*m2)/(2*(1-rho)); %slide 28 L15
disp(["R",R1]);






