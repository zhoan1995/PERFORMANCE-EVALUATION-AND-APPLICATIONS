clc; close all; clear;
%% assignment 8

s=1;
t=0;
Tmax=100000;
trace=[t,s];
Ts1=0;  %time spends in working state
Ts2=0;  %time spends in report state
Ts3=0;  %time spends in maintenance state

roundTripTime=0;

while t<Tmax
    if s==1
        
        dtReport=-log(rand())/0.05;   %generate Exp distribution
        dtMaint=-log(rand())/0.001;   %generate Exp distribution
        dt=min(dtMaint,dtReport);
        Ts1=Ts1+dt;
        roundTripTime=roundTripTime+dt;
        if dtReport<dtMaint
          ns=2;
        else 
          ns=3;
        end
    end
    if s==2

        dtWorking=-log(rand())/1;   %generate Exp distribution
        dtMaint=-log(rand())/0.001;   %generate Exp distribution
        dt=min(dtMaint,dtWorking);
     
        Ts2=Ts2+dt;
        roundTripTime=roundTripTime+dt;
        if dtWorking<dtMaint
          ns=1;
        else 
          ns=3;
        end
    end
    if s==3
        ns=1;
        dtWorking=-log(rand())/0.05;
        Ts3=Ts3+dtWorking;
        roundTripTime=roundTripTime+dt;
        
    end
   s=ns;
   t=t+dt;
end

Ps1=Ts1/t;   %prob of being in state Working
Ps2=Ts2/t;   %prob of being in state Report
Ps3=Ts3/t;   %prob of being in state Maintenance
ReportFreq=Ts2/(roundTripTime-Ts2);

