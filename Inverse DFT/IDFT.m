% Inverse Discrete Fourier Transform

clear all;
close all;
clc;
X=[2 -2+2j -2 -2-2j];
l=length(X);
 
for n=1:l
    x(n)=0;
    for k=1:l
        a=n-1;
        b=k-1;
        x(n)=x(n)+X(k)*exp(1j*2*pi*a*b/l);
    end
    x(n)=x(n)/l;
end
 
y=ifft(X);
 
figure(2);
subplot(3,1,1);
stem(X);
title('Input Signal X(k)');
 
subplot(3,1,2);
stem(x);
title('Inverse Discrete Fourier Transform of X(k) : {x(n)}');
 
 
subplot(3,1,3);
stem(y);
title('IDFT of X(k) using inbuilt function');

