% Generation of sine wave of different phase

a=5;
f=5;
t=0:1/(20*f):1;
pi=3.142;
x=a*sin(2*pi*f*t);
y=a*sin((2*pi*f*t)+pi/2);
w=a*sin((2*pi*f*t)+3*pi/2);
z=a*sin((2*pi*f*t)+pi);

plot(t,x);
xlabel('Time in s')
ylabel('x(t)')
title('Sinusoidal signal of F Hz')
hold on;
plot(t,w)
plot(t,y)
plot(t,z)
