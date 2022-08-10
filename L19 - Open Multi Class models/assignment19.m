clc; close all; clear;
%% assignment 19

lambdaE=0.1;
lambdaC=10;

d1E=2;
d2E=5;

d1C=0.06;
d2C=0.04;

util1=(lambdaE*d1E)+(lambdaC*d1C); %if >1, not stable %slide 39&40 L19
util2=(lambdaE*d2E)+(lambdaC*d2C); %if >1, not stable
U=[util1 util2];
disp(["U:",U]);
% residence time
r1E=d1E/(1-util1); %slide 56 L19
r2E=d2E/(1-util2);
r1C=d1C/(1-util1);
r2C=d2C/(1-util2);

rk1=(lambdaE*r1E/(lambdaE+lambdaC))+(lambdaC*r1C/(lambdaE+lambdaC)); %slide 43 L19
rk2=(lambdaE*r2E/(lambdaE+lambdaC))+(lambdaC*r2C/(lambdaE+lambdaC));
Rk=[rk1 rk2];
disp(["Rk:",Rk]);
ResponseTime=rk1+rk2;
disp(["R:",ResponseTime]);






