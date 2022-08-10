clc; close all; clear all;
%% assignment 5_N=500
%% A continuous uniform distribution between [10, 20]
Conti_unif=10+(20-10).*rand(500,1);
u_sort=sort(Conti_unif);
hold on
plot(u_sort,[1:500]/500);
xlim([0,50])
mean_Unif=mean(u_sort);
Var_Conti=var(u_sort);
cv_Unif=sqrt(Var_Conti)/mean_Unif;

%% A discrete distribution
Pr=[5,0.2,0.2; 15,0.6,0.8; 20,0.2,1]; %number,pdf,cdf
out=zeros(500,1);
u=rand(500,1);

for i=1:500
    if u(i,1)<Pr(1,3)              %slide 28-L05 _ Discrete distribution
        out(i,1)=Pr(1,1);
    elseif u(i,1)<Pr(2,3)
        out(i,1)=Pr(2,1);
    else 
        out(i,1)=Pr(3,1);
    end
end
hold on
   plot(sort(out),[1:500]/500,"-");     
mean_discrete=mean(out);  
Var_discrete=var(out);
cv_discrete=sqrt(Var_discrete)/mean_discrete;

%% An exponential distribution with average 15

ExpDis=-log(rand(500,1))/0.06;
mean_Exp=mean(ExpDis);
Var_Exp=var(ExpDis);
cv_Exp=sqrt(Var_Exp)/mean_Exp;
hold on;
plot(sort(ExpDis),[1:500]/500,"-"); 

%% Hyper Exp
for i=1:500
    if rand<0.5 %switching prob
       out_Hyper(i,1)=-log(rand)/0.1; 
    else out_Hyper(i,1)=-log(rand)/0.05;
    end
end
mean_hyper=mean(out_Hyper);
Var_hyper=var(out_Hyper);
cv_hyper=sqrt(Var_hyper)/mean_hyper;
hold on;
plot(sort(out_Hyper),[1:500]/500,"-"); 
%% Hypo Exp
outHypo=-log(rand(500,1))/0.1-log(rand(500,1))/0.2;
stage=2;
mean_hypo=mean(outHypo);
hold on;
 plot(sort(outHypo),[1:500]/500,"-"); 
 cv_Hypo=1/sqrt(stage);


%% Hyper Erlang
HyperErlRan=rand(500,1);
outHyperErl=zeros(500,1);
for i=1:500
    if HyperErlRan(i,1)<0.1       
        outHyperErl(i)=-(log(rand(1,1)))/0.02;
    elseif HyperErlRan(i,1)<0.5
        outHyperErl(i)=-(log(rand(1,1))+log(rand(1,1)))/0.2;
    else 
        outHyperErl(i)=-(log(rand(1,1))+log(rand(1,1))+log(rand(1,1)))/0.25;
    end
end

meanErlang=mean(outHyperErl);
Var_Erl=var(outHyperErl);
cv_Erl=sqrt(Var_Erl)/meanErlang;
hold on;
plot(sort(outHyperErl),[1:500]/500,"-"); 
legend('Uniform','Discrete','Exponential','Hyper','Hypo','HyperErlang')



        
        