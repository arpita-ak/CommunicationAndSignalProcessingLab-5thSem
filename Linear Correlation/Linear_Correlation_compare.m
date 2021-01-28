% Linear correlation program

clc;
clear all;
close all;
disp('linear correlation program');

x=[4 3 2 1];
%x=input('Enter x(n) : ');
y=[2 1 -1 3 2];
%h=input('Enter y(n) : ');
n=length(y);

R_inbuilt= xcorr(x,y);
disp(R_inbuilt);

subplot(3,2,1), stem(x);
title(['i/p sequencce x(n) is: ', num2str(x)]);
xlabel('n');
ylabel('x(n)');grid;


subplot(3,2,2), stem(y);
title(['i/p sequencce y(n) is: ', num2str(y)]);
xlabel('n');
ylabel('y(n)');grid;

disp('correlation of x(n) & y(n) is R:');
x=[zeros(1,n),x,zeros(1,n)];
m=length(x);
R=zeros(1,m-n-1);

for i=1:m-n-1
       
           for j=1:n
                      R(i)= R(i)+ x(i+j)* y(j);
                      
           end
           
end



subplot(3,2,[3,4]),stem(R);
title('correlation of x(n) & y(n) is :');
xlabel('n');
ylabel('y(n)');grid;

subplot(3,2,[5,6]),stem(R_inbuilt);
title('correlation of x(n) & y(n) using Inbuilt function xcorr is :');
xlabel('n');
ylabel('y(n)');grid;

disp(x)
disp(y)
disp(R)
