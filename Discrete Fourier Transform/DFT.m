
% Discrete Fourier Transform
clear all;
close all;
clc;
t=0:1/100:10-1/100
x=sin(2*pi*1*t);
n=length(x);
 
for k=1:n
    X(k)=0;
    for p=1:n
        a=p-1;
        b=k-1;
        X(k)=X(k)+x(p)*exp(-1*1j*2*pi*a*b/n);
    end
end
 
Y=fft(x);
 
figure(1);
subplot(3,1,1);
plot(t,x);
xlabel('Time in second');
title('Input Signal x(n)');
 
subplot(3,1,2);
stem(t,X);
xlabel('Frequency in hertz');
title(' Discrete Fourier Transform of x(n) : {X(k)}');
 
 
subplot(3,1,3);
stem(t,Y);
xlabel('Frequency in hertz');
title('DFT of x(n) using inbuilt function');

