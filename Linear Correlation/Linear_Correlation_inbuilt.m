% Linear correlation program using inbuilt correlation function

clc;
clear all;
close all;
disp('linear correlation program');

x=[1 2 3 4 5];
m=length(x);
y=[6 7 8];
n=length(y);

R= xcorr(x,y);
disp(R);

subplot(2,2,1), stem(x);
title(['i/p sequencce x(n) is: ', num2str(x)]);
xlabel('n');
ylabel('x(n)');grid;

subplot(2,2,2), stem(y);
title(['i/p sequencce y(n) is: ', num2str(y)]);
xlabel('n');
ylabel('y(n)');grid;

subplot(2,2,[3,4]),stem(R);
title('correlation of x(n) & y(n) is :');
xlabel('n');
ylabel('y(n)');grid;



