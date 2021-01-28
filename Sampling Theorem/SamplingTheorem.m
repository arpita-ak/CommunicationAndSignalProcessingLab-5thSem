% Sampling Theorem

a=10;
f=5;
t=0:1/(20*f):2;

x=a/2 *sin(2*pi*f*t);
subplot(4,2,1);
%figure(1)
plot(t,x);
xlabel('time in sec')
ylabel('x(t)')
title('sinusoidal signal of F hz')

% Continuos plot
a=10;
f=5;
t=0:1/(20*f):2;
x=a/2 *sin(2*pi*f*t);
subplot(4,2,2);
%figure(1)
plot(t,x);
xlabel('time in sec')
ylabel('x(t)')
title('sinusoidal signal of F hz')

% Sampling the sine wave
% Under Sampling
Fs1=8;

t1=0:1/(Fs1):2;
x1=a/2*sin(2*pi*f*t1);
subplot(4,2,3);
%figure(2)
stem(t1,x1);
xlabel('time in sec')
ylabel('x1(t)')
title('Sampled sinusoidal signal of Fs<2F Hz')

% Critically Sampling
Fs1=10;
t1=0:1/(Fs1):2;
x2=a/2*sin(2*pi*f*t1);
subplot(4,2,5);
%figure(3)
stem(t1,x2);
xlabel('time in sec')
ylabel('x2(t)')
title('Sampled sinusoidal signal of Fs=2F Hz')

% Over Sampling
Fs1=30;
t1=0:1/(Fs1):2;
x3=a/2*sin(2*pi*f*t1);
subplot(4,2,7);
%figure(4)
stem(t1,x3);
xlabel('time in sec')
ylabel('x3(t)')
title('Sampled sinusoidal signal of Fs>2F Hz')

% Sampling the discrete sine wave
% Under Sampling
Fs1=8;
t1=0:1/(Fs1):2;
x1=a/2*sin(2*pi*f*t1);
subplot(4,2,4);
%figure(2)
plot(t1,x1);
xlabel('time in sec')
ylabel('x1(t)')
title('Sampled sinusoidal signal of Fs<2F Hz')

% Critically Sampling
Fs1=10;
t1=0:1/(Fs1):2;
x2=a/2*sin(2*pi*f*t1);
subplot(4,2,6);
%figure(3)
plot(t1,x2);
xlabel('time in sec')
ylabel('x2(t)')
title('Sampled sinusoidal signal of Fs=2F Hz')

% Over Sampling
Fs1=30;
t1=0:1/(Fs1):2;
x3=a/2*sin(2*pi*f*t1);
subplot(4,2,8);
%figure(4)
plot(t1,x3);
xlabel('time in sec')
ylabel('x3(t)')
title('Sampled sinusoidal signal of Fs>2F Hz')