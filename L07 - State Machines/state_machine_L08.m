
clc; close all; clear all;

%% state machines- slide 5- L08

s=1;
t=0;
Tmax=1000;
trace=[t,s];
winA=0;
winB=0;
winC=0;
winD=0;
Races=0;
RT=[];
nextIndex=1;

roundTripTime=0;
RTT=[];
roundIndex=1;

% slide 18- L07
while t<Tmax
    if s==1
     dtA=10+rand()*(20-10);
     dtB= 5+rand()*(30- 5);
     dtC=-(log(rand()))/0.07;
     dtD=-log(rand())/0.1-log(rand())/0.2;
     tt=[dtD dtC dtB dtA];
     dt=min(tt);
     if (dt==dtA)
         ns=2;
         winA=winA+1;
     end
     if (dt==dtB)
         ns=3;
         winB=winB+1;
         
     end
     if (dt==dtC)
         winC=winC+1;
         ns=4;
     end
     if (dt==dtD)
         ns=5;
         winD=winD+1;
     end
     Races=Races+1;
     RT(nextIndex,1)=dt;
     nextIndex=nextIndex+1;
    end
    if s==2
     ns=1;
     dt=-(log(rand())+ log(rand())+ log(rand())+ log(rand()))/4;
    end
    if s==3
     ns=1;
     dt=-(log(rand())+ log(rand())+ log(rand())+ log(rand()))/4;
    end
    if s==4
     ns=1;
     dt=-(log(rand())+ log(rand())+ log(rand())+ log(rand()))/4;
    end
    if s==5
     ns=1;
     dt=-(log(rand())+ log(rand())+ log(rand())+ log(rand()))/4;
    end
   s=ns;
   t=t+dt;
   trace(end+1,:)=[t,s];
end
   
stairs(trace(:,1),trace(:,2));
PwinA=winA/Races;
PwinB=winB/Races;
PwinC=winC/Races;
PwinD=winD/Races;
AveRT=mean(RT);
% Ps1=Ts1/t;   %prob of being in state 1
% Ps2=Ts2/t;   %prob of being in state 2
% Ps3=Ts3/t;   %prob of being in state 3
% figure;    
plot(sort(RT),[1:size(RT,1)]/size(RT,1),"+")    
%     
% min 20    
    
        