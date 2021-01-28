clear all;
clc;
wc=1;
N=7;
a=(N-1)/2;
n=0:1:N-1;
for j=0:1:(N-1)
    wr(j+1)=1;
end;
for j=0:1:(N-1)
    wbr(j+1)=1-2.*abs(j-a)/N-1;
    whm(j+1)=0.54-0.46*cos(2*3.14*j/(N-1));
    whn(j+1)=0.5-0.5*cos(2*3.14*j/(N-1));
end;
for i=0:1:(N-1)
    if(i~=a)
        hd(i+1)=sin(wc*(i-a))/(pi*(i-a));
    else
        hd(i+1)=wc/pi;
    end;
end;
hn=hd.*whm;
hw=[];
for w=0:(1/pi):pi
    t=0;
    temp=0;
    const=hn(a+1);
    for i=0:1:((N-3)/2)
        temp=temp+2.*hn(i+1).*cos(w.*(a-i));
    end;
    temp=temp+const;
    hw=[hw temp];
end;
n=0:1:N-1;
w=0:(1/pi):pi;
subplot(5,1,1);
stem(n,hd);

subplot(5,1,2);
stem(n,hn);

subplot(5,1,3);
stem(n,whm);

subplot(5,1,4);
stem(w,hw);
phase= -w*a;
subplot(5,1,5);
stem(w,phase);

