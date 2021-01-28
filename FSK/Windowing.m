N=65

for n=1:1:N
    rect(n)=10
    Hanning(n)=0.5 - 0.5*cos(2*pi*n/N)
    Hamming(n)=0.54 - 0.46*cos(2*pi*n/N)
    Blackmann(n)=0.42 - 0.5*cos(2*pi*n/N) + 0.08*cos(4*pi*n/N)
end

n=1:1:N 

figure(1)
subplot(2,2,1)
plot(n,rect)
title('Rectanguar Window')

subplot(2,2,2)
plot(n,Hanning)
title('Hanning Window')

subplot(2,2,3)
plot(n,Hamming)
title('Hamming Window')

subplot(2,2,4)
plot(n,Blackmann)
title('Blackmann Window')


