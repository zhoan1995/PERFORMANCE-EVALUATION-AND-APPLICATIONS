
clc; close all; clear all;

%% asiignment 7- state machines

s=1;
t=0;
Tmax=100000;
trace=[t,s];
Ts1=0;
Ts2=0;
Ts3=0;

roundTripTime=0;
RTT=[];
roundIndex=1;

% slide 18- L07
while t<Tmax
    if s==1
        ns=2;
        dt=50+rand()*(100-50);   %generate uniform distribution
        Ts1=Ts1+dt;
        roundTripTime=roundTripTime+dt;

    end
    if s==2
        ns=3;
        dt=250+rand()*(500-250);  %generate uniform distribution
        Ts2=Ts2+dt;
        roundTripTime=roundTripTime+dt;
    end
    if s==3
        ns=1;
        dt=100+rand()*(200-100);  %generate uniform distribution
        Ts3=Ts3+dt;
        roundTripTime=roundTripTime+dt;
        RTT(roundIndex,1)=roundTripTime;
        roundTripTime=0;
        roundIndex=roundIndex+1;
    end
   s=ns;
   t=t+dt;
   trace(end+1,:)=[t,s];
end
   
stairs(trace(:,1),trace(:,2));
Ps1=Ts1/t;   %prob of being in state 1
Ps2=Ts2/t;   %prob of being in state 2
Ps3=Ts3/t;   %prob of being in state 3
figure;    
plot(sort(RTT),[1:size(RTT,1)]/size(RTT,1),"+")    
    
% min 20    
    
        