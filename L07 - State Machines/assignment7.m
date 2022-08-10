clc; close all; clear all;
%% assignment 7

s=1;
t=0;
Tmax=1000;
trace=[t,s];
Ts1=0;
Ts2=0;
Ts3=0;

roundTripTime=0;
RTT=[];
roundIndex=1;


while t<Tmax
    if s==1
       
       if rand()<0.8 
           ns=2; %next state
       else
          if rand()<0.5
               ns=3;
           else 
               ns=1;
          end
       end
       dt=-(log(rand())+ log(rand())+ log(rand()))/0.1; %generating three stage Erlang dist
       Ts1=Ts1+dt;
       roundTripTime=roundTripTime+dt;
    end
    if s==2
        if rand()<0.5
               ns=3;
           else 
               ns=1;
          end
        dt=-log(rand())/0.01;  %generate Exp distribution
        Ts2=Ts2+dt;
        roundTripTime=roundTripTime+dt;
    end
    if s==3
        ns=1;
        dt=-log(rand())/0.005;  %generate Exp distribution
        Ts3=Ts3+dt;
        roundTripTime=roundTripTime+dt;
%         RTT(roundIndex,1)=roundTripTime;
%         roundTripTime=0;
%         roundIndex=roundIndex+1;
    end
   s=ns;
   t=t+dt;
   trace(end+1,:)=[t,s];
end
   
%stairs(trace(:,1),trace(:,2));
Ps1=Ts1/t;   %prob of being in state 1
Ps2=Ts2/t;   %prob of being in state 2
Ps3=Ts3/t;   %prob of being in state 3

U=(Ts1+Ts2)/t;

% figure;    
% plot(sort(RTT),[1:size(RTT,1)]/size(RTT,1),"+")    