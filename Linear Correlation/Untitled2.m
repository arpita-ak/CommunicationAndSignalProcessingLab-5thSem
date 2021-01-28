clc;
close all;
clear all;
X= [[6 + 0.000000000000001i ; -2 + 2i ; -2 - 0.000000000000001i;-1.999999999999998 - 2.000000000000001i] ];
N = length(X);
x = zeros(N,1)
for k = 0:N-1
    for n = 0:N-1
        x(k+1) = x(k+1) + X(n+1)*exp(2j*pi*n*k/N)/N
    end
end
t = 0:N-1
subplot(311)
stem(t,X);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time domain - Input sequence')

subplot(312)
stem(t,x)
xlabel('Frequency');
ylabel('|X(k)|');
title('Frequency domain - Magnitude response')

subplot(313)
stem(t,angle(x))
xlabel('Frequency');
ylabel('Phase');
title('Frequency domain - Phase response')