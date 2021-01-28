%%qpsk
%% convertion of data to length;

x=[1 0 0 1 1 0 1 0];
data_NZR=2*x-1; 
s_p_data=reshape(data_NZR,2,length(x)/2); 
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
f=br*2;
t2=bp/99:bp/99:bp;
ss=length(t2);
m=[];
for i=1:1:length(x)/2    %to convert to ask;
    if x(i)==1
        y1=s_p_data(1,i)*cos(2*pi*f*t);
        y2=s_p_data(1,i)*sin(2*pi*f*t);;
    end;
    m= [m y1];
    m= [m y2];
end;
mn=[];
t=bp/99:bp/99:bp;
for n=ss:ss:length(m)
    y=sin(2*pi*f*t);
    mm=y.*m((n-(ss-1)):n);
    z=trapz(t,mm);
    zz=round(2*z/bp);
    if zz>0
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
tt=bp/99:bp/99:(bp*length(x));
plot(tt,m);



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

