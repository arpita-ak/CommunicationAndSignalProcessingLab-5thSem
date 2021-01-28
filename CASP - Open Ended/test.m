% Generating Input Signal

f=5;
t = 0:0.01:1;
x = sin(2*pi*f*t);
%plot(t,x,'m');
%hold on;
x = awgn(x,15);
%plot(t,x,'b');

n = length(x)
%ff=-f/2+0.5-8*f/n:f/n:f/2-0.5+7*f/n;
ff=-f/2:f/n:(f/2);
ff=ff(1:end-1);
Y=abs(fftshift(fft(x)));
stem(ff,Y)