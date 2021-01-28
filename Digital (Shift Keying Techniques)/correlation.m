%%correlation
clear all;
clc;
x=[1 1 2 1];
h=[2 3 1 1];
posx=0;
posh=0;

lengthx=length(x);
lengthh=length(h);
n1=0:1:(lengthx-1);
ni=posx-(posh+lengthh-1);
nf=ni+(lengthx+lengthh-2);
n=ni:1:nf;
y=xcorr(x,h);

subplot(3,1,1);
stem(x);

subplot(3,1,2);
stem(h);

subplot(3,1,3);
stem(n,y);
