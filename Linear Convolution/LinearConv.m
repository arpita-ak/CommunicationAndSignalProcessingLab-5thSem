% Linear convolution program

clc;
clear all;
close all;
disp('linear convolution program');

x=[1,3,2,1];
%x=input('Enter x(n) : ');
m=length(x);
h=[1,-1,2];
%h=input('Enter h(n) : ');
n=length(h);

x=[x,zeros(1,n)];
subplot(3,2,1), stem(x);
title(['i/p sequencce x(n) is: ', num2str(x)]);
xlabel('n');
ylabel('x(n)');grid;

h=[h,zeros(1,m)];
subplot(3,2,2), stem(h);
title(['i/p sequencce h(n) is: ', num2str(h)]);
xlabel('n');
ylabel('h(n)');grid;

disp('convolution of x(n) & h(n) is y(n):');
y=zeros(1,m+n-1);

for i=1:m+n-1
            y(i)=0;
            for j=1:m+n-1
                        if(j<i+1)
                                    y(i)=y(i)+x(j)*h(i-j+1);
                        end
            end
end


subplot(3,2,[3,4]),stem(y);
title('convolution of x(n) & h(n) is :');
xlabel('n');
ylabel('y(n)');grid;

c= conv(x,h);
subplot(3,2,[5,6]),stem(y);
title('convolution of x(n) & h(n) is :');
xlabel('n');
ylabel('y(n)');grid;



disp(x)
disp(h)
disp(y)
disp(c);
