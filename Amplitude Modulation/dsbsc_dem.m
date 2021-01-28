clc
clear all

fs = 1000;                  %Sampling Freq
t= 0:(1/fs):1;              %time

fm = 4;                     %Message Sig Freq
m = cos(2*pi*fm*t);         %Message Sig

figure(1);
subplot(2,1,1);
plot(t,m);
xlabel('time');
ylabel('Amp');
title(['Sine Mesg Sig fm=',num2str(fm),'Hz']);

N = length (m);
M = fftshift(fft(m,N));
f = fs*[-N/2:N/2-1]/N;
subplot(2,1,2);
stem(f,abs(M));
xlabel('freq');
ylabel('DFT Values');
title(['Spectrum of Msg Sig']);

fc = 50;                     %Carrier Sig Freq
c = cos(2*pi*fc*t);          %Carrier Sig

figure(2);
subplot(2,1,1);
plot(t,c);
xlabel('time');
ylabel('Amp');
title(['Sine Mesg Sig fm=',num2str(fc),'Hz']);

N = length (c);
C = fftshift(fft(c,N));
f = fs*[-N/2:N/2-1]/N;
subplot(2,1,2);
stem(f,abs(C));
xlabel('freq');
ylabel('DFT Values');
title(['Spectrum of Carrier Sig']);

y = m.*c;

figure(3);
subplot(2,1,1);
plot(t,y);
xlabel('time');
ylabel('Amp');
title(['DSB-SC Signal']);

N = length (y);
Y = fftshift(fft(y,N));
f = fs*[-N/2:N/2-1]/N;
subplot(2,1,2);
stem(f,abs(Y));
xlabel('freq');
ylabel('DFT Values');
title(['Spectrum of Carrier Sig']);

%DSB-SC Demodulation 

z = 2*y.*c;
figure(4);
subplot(2,1,1);
plot(t,z);
xlabel('time');
ylabel('Amp');
title(['Product Modulator Signal']);

N = length (z);
Z = fftshift(fft(z,N));
f = fs*[-N/2:N/2-1]/N;
subplot(2,1,2);
stem(f,abs(Z));
xlabel('freq');
ylabel('DFT Values');
title(['Spectrum of Product Modulator Sig']);

%LOW Pass Filtering
[num,den] = butter(5,4*fm/fs);
rec = filter(num,den,z);
figure(5);
subplot(2,1,1);
plot(t,rec);
xlabel('time');
ylabel('Amp');
title(['Low Pass Filtered Signal']);

N = length (rec);
R = fftshift(fft(rec,N));
f = fs*[-N/2:N/2-1]/N;
subplot(2,1,2);
stem(f,abs(R));
xlabel('freq');
ylabel('DFT Values');
title(['Spectrum of Low Pass Filtered Signal']);
