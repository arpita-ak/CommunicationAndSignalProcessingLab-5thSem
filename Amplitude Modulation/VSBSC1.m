%SingleSideBand Supressed Carrier (SSB-SC
%Saurav R Tuladhar  059BEX438/DOECE/PC/IOE
fc = 400; %Carrier Frequency
fm = 50;  %Baseband Frequency
fs= 22050;  %sampling frequency
Ts=1/fs;  %sampling period 
N=10000;  %number of samples
t=[0:Ts:N*Ts-Ts];%time axis  

m = cos(2*pi*fm*t);        %Baseband signal/message signal
mh = imag(hilbert(m));     %Hilbert Transform of baseband

sb = m.*cos(2*pi*fc*t) + mh.*cos(2*pi*fc*t);   %Expression for SSB with USB, use + for LSB

f=[-fs/2:fs/N:fs/2-fs/N];%frequency axis
plot(t,sb);
title('Single SideBand Modulation');
xlabel('Time');
ylabel('ssb');

Y=fft(sb);%modulated signal DFT
figure()
stem(f,fftshift(abs(Y))) ;title('AM Signal Spectrum');xlabel('Frequency axis');ylabel('Amplitude');