clc;
clear all;
close all;
n=8;
x=randi([0,1],1,n);                                             %random bit generator
bp=.000001;                                                    % bit period
disp(' Binary information at Trans mitter :');
disp(x);
% representation of transmitting binary information as digital signal 
bit=[]; 
for n=1:1:length(x)
    if x(n)==1;
       se=ones(1,100);
    else 
        se=zeros(1,100);
    end
    bit=[bit se];
end
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(4,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('amplitude(volts)');
xlabel(' time(sec)');
title('Binary data in the form of a digital signal');
%XXXXXXXXXXXXXXXXXXXXXXX Binary-PSK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX
A=5;                                          % Amplitude of carrier signal 
br=1/bp;                                                         % bit rate
f=br*2;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;                 
ss=length(t2);
m=[];                                          
kl=[];
for i=1:1:length(x)
    wave=A*sin(2*pi*f*t2);
    kl=[kl wave];
end
for i=1:1:length(x)
    if (x(i)==1)
        y=A*sin(2*pi*f*t2);
    else
        y=A*sin(2*pi*f*t2+pi);   %-A*sin(2*pi*f*t)
    end
    m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(4,1,2);
plot(t3,kl);grid on;
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Carrier Signal');
subplot(4,1,3);
plot(t3,m);grid on;
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('PSK modulated wave coresponding to binary information at the transmitter');
%XXXXXXXXXXXXXXXXXXXX Binary PSK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
mn=[];
for n=ss:ss:length(m)  
  t=bp/99:bp/99:bp;
  y=sin(2*pi*f*t);                                        % carrier siignal 
  mm=y.*m((n-(ss-1)):n);
  t4=bp/99:bp/99:bp;
  z=trapz(t4,mm);                                              % intregation 
  zz=round((2*z/bp));                                     
  if(zz>0)                                        % logic level = (A+A)/2=0 
                         %because A*sin(2*pi*f*t+pi) means -A*sin(2*pi*f*t)
    a=1;
  else
    a=0;
  end
  mn=[mn a];
end
disp(' Binary data at Receiver :');
disp(mn);
%Representation of binary information as digital signal which is acheived 
%after PSK demodulation 
bit=[];
for n=1:length(mn)
    if mn(n)==1;
       se=ones(1,100);
    else
        se=zeros(1,100);
    end
     bit=[bit se];
end
t4=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(4,1,4);
plot(t4,bit,'LineWidth',2.5);grid on;
axis([ 0 bp*length(mn) -.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('PSK demodulated wave corresponding to binary information at the receiver '); 
