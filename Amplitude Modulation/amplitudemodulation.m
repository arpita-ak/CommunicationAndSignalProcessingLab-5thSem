% Amplitude Modulation

clc
clear all
close all
% Message signal frequency
fm=10;
% Carrier wave frequency
fc=100;

Am=5;
Ac=10;

t=0:0.0002:1;
mt=Am*cos(2*pi*fm*t);
ct=Ac*cos(2*pi*fc*t);


st=Ac*(1+(0.5*cos(2*pi*fm*t))).*cos(2*pi*fc*t);
st1=Ac*(1+(1*cos(2*pi*fm*t))).*cos(2*pi*fc*t);
st2=Ac*(1+(2*cos(1.5*pi*fm*t))).*cos(2*pi*fc*t);


figure(1)
subplot(5,1,1), plot(t,mt,'r');
ylabel('Message signal');
xlabel('t');
title('Amplitude modulation');

subplot(5,1,2), plot(t,ct);
ylabel('Carrier signal');
xlabel('t');

subplot(5,1,3), plot(t,st);
title('Mu<1');
xlabel('t');
hold on;
plot(t,mt,'r');

subplot(5,1,4), plot(t,st1);
title('with Mu=1');
xlabel('t');
hold on;
plot(t,mt,'r');

subplot(5,1,5), plot(t,st2);
title('with Mu>1');
xlabel('t');
hold on;
plot(t,mt,'r');

