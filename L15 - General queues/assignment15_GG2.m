clc; close all; clear;
%% assignment 15

%uniform process
a=0.1;
b=0.2;

m=(a+b)/2;
varA=((b-a).^2)/12;
cvA=sqrt(varA)/m;
lambdaA=1/m;

%service time- hyper Exp

lambdaS1=1;
lambdaS2=10;
p1=0.2;

mS=p1/lambdaS1+(1-p1)/lambdaS2;
m2S=2*(p1/(lambdaS1.^2)+(1-p1)/(lambdaS2.^2));
varS=m2S-mS.^2;
cvS=sqrt(varS)/mS;

D=mS;

%traffic intensity
p=lambdaA*D*0.5;

%utilization
U=lambdaA*D;
disp(["U",U]);

%avg response time
R=D+((cvA.^2+cvS.^2)/2)*(((p.^2)*D)/(1-p.^2));
disp(["R:",R]);

%avg number of jobs 
N=lambdaA*R;
disp(["N:",N]);




