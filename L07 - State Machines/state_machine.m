clc; close all; clear all;

%% state machines-slide 25 L07

s=1;
t=0;
Tmax=100;
trace=[t,s];
Ts1=0;
Ts2=0;
Ts3=0;
C=0;

% slide 18- L07
while t<Tmax
    if s==1
       dt=-(log(rand())+ log(rand())+ log(rand())+ log(rand()))/5;
       Ts1=Ts1+dt;
       if rand()<0.3
           ns=2;
       else
           ns=3;
       end
    end
    if s==2
       ns=1;
       dt=-(log(rand())+log(rand()))/10;
       Ts2=Ts2+dt;
       C=C+1;
    end
    if s==3
       ns=1;
       dt=-(log(rand())+ log(rand())+ log(rand()))/8;  %inja meghdaresho taghir dad o 16 gozasht, hala bayad bfahmam chika mikone in zarayeb
       Ts3=Ts3+dt;
       C=C+1;
    end
   s=ns;
   t=t+dt;
   trace(end+1,:)=[t,s];
end
   

Ps1=Ts1/t   %prob of being in state 1
Ps2=Ts2/t   %prob of being in state 2
Ps3=Ts3/t   %prob of being in state 3
X=C/t %meghdaresh ba chizi k ostad too code a bdast avord fasele ziadi dare
stairs(trace(:,1),trace(:,2));


    
        