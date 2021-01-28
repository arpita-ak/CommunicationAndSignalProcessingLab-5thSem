%%fsk
%% convertion of data to length;

x=[1 0 0 1 1 0 1];
bp=.000001;
bit=[];
for n=1:1:length(x)
    if x(n)==1
        se=ones(1,100);
    elseif x(n)==0
        se=zeros(1,100);
    end;
        bit=[bit se];
end;
t1=bp/100:bp/100:100*length(x)*(bp/100);
A=5;
br=1/bp;
f1=br*81;
f2=br*2;
t2=bp/99:bp/99:bp;
ss=length(t2);
m=[];
for i=1:1:length(x)    %to convert to ask;
    if x(i)==1
        y=A*cos(2*pi*f1*t2);
    elseif x(i)==0
        y=A*cos(2*pi*f2*t2);
    end;
    m= [m y];
end;
mn=[];
t=bp/99:bp/99:bp;
for n=ss:ss:length(m)
    y1=cos(2*pi*f1*t);
    y2=cos(2*pi*f2*t);
    mm=y1.*m((n-(ss-1)):n);
    mmm=y2.*m((n-(ss-1)):n);
    z1=trapz(t,mm);
    zz1=round(2*z1/bp);
    z2=trapz(t,mmm);
    zz2=round(2*z2/bp);
    if zz1>(A/2)
        a=1;
    else(zz2>(A/2))
        a=0;
    end;
    mn=[mn a];
end;
disp(mn);

subplot(3,1,1);
plot(t1,bit);
axis([ 0 bp*length(x) -.5 1.5]);

subplot(3,1,2);
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2);
plot(t3,m);



bit=[];
for n=1:length(mn);
    if mn(n)==1;
       se=ones(1,100);
    else mn(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];
end
t4=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(3,1,3)
plot(t4,bit);
axis([ 0 bp*length(mn) -.5 1.5]);

