% Time and frequency domain waveform of modulated signal which has phase
% reversal of 180 degree using matlab  
clear all;
close all;
clc;
fm=0.5;
Am=0.85;
fc=250;
Ac=1;
t=0:0.15:10;
mt=Am*cos(2*pi*fm*t);
ct=Ac*cos(2*pi*fc*t);
mod_index=0.85;
st=Ac*(1+(mod_index)*cos(2*pi*fm*t)).*cos(2*pi*fc*t);

s=st.*ct;
w=(fc-fm)/(fc+fm);
[b,a]=butter(2,w);
dmodmt=filter(b,a,s);
dmodmt=dmodmt-1;

subplot(3,2,1);
plot(t,mt); xlabel('time'); 
ylabel('m(t)');
title('Message signal');

subplot(3,2,2);
plot(t,ct);
xlabel('time'); 
ylabel('c(t)'); 
title('Carrier signal');

subplot(3,2,3);
plot(t,st);
xlabel('time'); 
ylabel('s(t)');
title('Amplitude modulated signal');

subplot(3,2,4);
plot(t,dmodmt);
xlabel('time'); 
ylabel('Demodulated m(t)');
title('Demodulated signal');

subplot(3,2,5);
[Pxx,F] = periodogram(st,[],length(st),fc);
 plot(F,10*log10(Pxx));

title('PSD');




