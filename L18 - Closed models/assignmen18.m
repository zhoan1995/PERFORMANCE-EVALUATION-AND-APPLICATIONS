clc; close all; clear;
%% assignment 18

N=100; %number of employees

%mail server
s_m=0.05;
v_m=0.7;
D_m=s_m*v_m;

%file server
s_f=0.15;
v_f=0.2;
D_f=s_f*v_f;

% application server

s_a=0.025;
v_a=1;
D_a=s_a*v_a;

%think time
z=10;

% service time demand
D=[D_m, D_f, D_a];
disp(["D:",D]);

% MVA process slide 9 L18
Q=zeros(1,3);
R_k=zeros(1,3);

for i=[1:N]
    for ii=[1:3]
       R_k(ii)=D(ii)*(1+Q(1,ii)); %sllide 5 L18
    end
    x=i/(z+sum(R_k)); %sllide 6 L18
    for ii=[1:3]
        Q(ii)=x*R_k(ii); %sllide 7 L18
    end
end

% throughput
disp(["x:",x]);

% response time
R=sum(R_k);
disp(["R:",R]);
