clc

f=5;

% t = 0:0.01:1;
% x = sin(2*pi*f*t);
% %plot(t,x,'m');
% %hold on;
% x = awgn(x,15);
% %plot(t,x,'b');

[x,f]=audioread("FusionSitar.wav");
SR = 44100;
x = x(8000:15000,1);
n = length(x);

%ff=-f/2+0.5-8*f/n:f/n:f/2-0.5+7*f/n;
ff=-f/2:f/n:(f/2);
ff=ff(1:end-1);
Y=abs(fftshift(fft(x)));
stem(ff,Y)

N = 7;
F=10000

f_low = LowPass(N,(F/4)*2*pi/SR)
plot(f_low)
freqz(f_low)

f_band1 = BandPass(N,(F/4)*2*pi/SR,(F/2)*2*pi/SR)
plot(f_band1)
freqz(f_band1)

f_band2 = BandPass(N,(F/2)*2*pi/SR,(3*F/4)*2*pi/SR)
plot(f_band2)
freqz(f_band2)

f_high = HighPass(N,(3*F/4)*2*pi/SR)
plot(f_high)
freqz(f_high)

y1=cconv(x,f_low);
y2=cconv(x,f_band1);
y3=cconv(x,f_band2);
y4=cconv(x,f_high);

plot(y1)
plot(y2)
plot(y3)
plot(y4)

de1=zeros(44100,1);

y11 = [y1;de1]
y22 = [y2;de1]
y33 = [y3;de1]
y44 = [y4;de1]
yy = y11+y22+y33+y44;
sound(yy,f)

function hd= LowPass(N,Wc)
    alpha =(N-1)/2;
    n=0:N-1;
    hd=sin(Wc*(n-alpha))./(pi*(n-alpha));
    hd(alpha+1)=Wc/pi;
end

function hd= HighPass(N,Wc)
    alpha =(N-1)/2;
    n=0:N-1;
    hd=(sin(pi*(n-alpha))-sin(Wc*(n-alpha)))./(pi*(n-alpha));
    hd(alpha+1)=1-(Wc/pi);
end

function hd= BandPass(N,Wc_low,Wc_high)
    alpha =(N-1)/2;
    n=0:N-1;
    hd=(sin(Wc_high*(n-alpha))-sin(Wc_low*(n-alpha)))./(pi*(n-alpha));
    hd(alpha+1)=(Wc_high-Wc_low)/pi;
end

function hd= BandStop(N,Wc_low,Wc_high)
    alpha =(N-1)/2;
    n=0:N-1;
    hd=(sin(Wc_low*(n-alpha))-sin(Wc_high*(n-alpha)))./(pi*(n-alpha))+sin(pi*(n-alpha));
    hd(alpha+1)=1-((Wc_low-Wc_high)/pi);
end

function w = hamming_window(N)
n=0:N-1;
w=0.54-0.46*cos(2*pi*n/(N-1));
stem(w)
end

