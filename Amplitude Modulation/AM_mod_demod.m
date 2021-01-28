 
clear all;
close all;
clc;
fm=0.05;
am=1;
fc=0.5;
ac=1;
t=0:0.1:50;
mt=am*cos(2*3.14*fm*t);
ct=ac*cos(2*3.14*fc*t);
u=am/ac;
st=ac*(1+u*cos(2*3.14*fm*t)).*cos(2*3.14*fc*t);

s=2*st.*cos(2*3.14*fc*t);

w=(fc-fm)/(fc+fm);
[b,a]=butter(9,0.1);
demod=filter(b,a,s);
demod=demod-1;

subplot(2,2,1);
plot(t,mt);
xlabel('t');
ylabel('m(t)');
title('Message signal');

subplot(2,2,2);
plot(t,ct);
xlabel('t');
ylabel('c(t)');
title('Carrier signal');

subplot(2,2,3);
plot(t,st);
xlabel('t');
ylabel('s(t)');
title('Modulated  signal');

subplot(2,2,4);
plot(t,demod);
xlabel('t');
ylabel('d(t)');
title('Demodulated  signal');