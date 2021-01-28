% Linear convolution program using inbuilt convolution function

clc;
clear all;
close all;
disp('linear convolution program');

x=[1 3 2 1];
m=length(x);
h=[1 -1 2];
n=length(h);

y= conv(x,h);
disp(y);

subplot(2,2,1), stem(x);
subplot(2,2,2), stem(h);
subplot(2,2,[3,4]),stem(y);

