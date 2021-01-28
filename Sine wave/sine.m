% Generation of sine wave

a=5;
f=5;
t=0:1/(20*f):1;
pi=3.142;
x=a*sin(2*pi*f*t);


plot(t,x);
xlabel('Time in s')
ylabel('x(t)')
title('Sinusoidal signal of F Hz')

