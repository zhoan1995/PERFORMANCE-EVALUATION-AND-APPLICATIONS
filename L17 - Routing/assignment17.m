clc; close all; clear;
%% assignment 17- batche model

lambdaIn=0.5;

%Each queue i is characterized by its own average service time Si.
s1=1;
s2=2;
s3=2.5;

p11=0.7;
p12=0.3;

p20=0.2;
p21=0.5;
p23=0.3;

p32=1;

x=lambdaIn; %slide 72 L16

lambda=[1 0 0];  
p=[ p11 p12 0;
    p21 0  p23;
    0  p32  0];

s_k=[s1 s2 s3];

% visit of 3 stations

v_k=lambda*(eye(3)-p)^(-1);  %slide 20 L17
disp(["V:",v_k]);

%demand of 3 stations

D_k=v_k.*s_k;  %slide 33L16
disp(["D:",D_k]);


%verify if the system is stable
U_k=D_k*x; %slide 40 L16

if U_k(1)>1 || U_k(2)>1 || U_k(3)>1
   fprintf('system is unstable!\n');
else 
    fprintf('system is stable!\n');
end



