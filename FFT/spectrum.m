% Fast Fourier transform with spectrum
clc;
clear all;
close all;

% Time specifications:
Fc = 50;
Fc1 = 5; %hertz
Fs = 2*max(Fc,Fc1) +1;    % samples per second
T = 1/Fs;                 % seconds per sample
t = 0: T : 1-T;
N = length(t);

% Message signal:
x = cos( 2*pi*Fc*t ) + 2 * sin(2*pi*Fc1*t);
%x= sin (2*pi*Fc*t)
figure(1)
subplot(2,1,1)
plot(t,x);
xlabel ('Time (in second )');
title('Message Signal')

%Fourier Transform:
Z=fft(x);
X=fftshift(Z);

% Frequency specifications:
f= - Fs/2 : Fs/N : (Fs/2)-1;    %hertz

%plot the spectrum :
subplot(2,1,2)
stem(f,abs(X)/N );
xlabel ('Frequency (in hertz )');
title('Magnitude Response');


