%% ASK modulation
%%
clear all;
close all;
clc;
A=5;
f1=20;
f2=2;
t=0:0.001:1;
x=(A*cos(2*pi*f1*t));
c=((A/2)*square(2*pi*f2*t))+(A/2);
y=x.*c;

subplot(3,1,1);
plot(t,c);
xlabel('time');
ylabel('amplitude');
title('Input signal');

subplot(3,1,2);
plot(t,x);
xlabel('time');
ylabel('amplitude');
title('Carrier signal');

subplot(3,1,3);
plot(t,y);
xlabel('time');
ylabel('amplitude');
title('ASK modulated signal');
