%%ask
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
a1=10;
a2=0;
br=1/bp;
f=br*10;
t2=bp/99:bp/99:bp;
ss=length(t2);
m=[];
for i=1:1:length(x)    %to convert to ask;
    if x(i)==1
        y=a1*cos(2*pi*f*t2);
    elseif x(i)==0
        y=a2*cos(2*pi*f*t2);
    end;
    m= [m y];
end;
mn=[];
t=bp/99:bp/99:bp;
for n=ss:ss:length(m)
    y=cos(2*pi*f*t);
    mm=y.*m((n-(ss-1)):n);
    z=trapz(t,mm);
    zz=round(2*z/bp);
    if zz>7.5
        a=1;
    else
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

