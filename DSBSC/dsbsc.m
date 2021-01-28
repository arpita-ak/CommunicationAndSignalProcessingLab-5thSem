   % DSBSC Modulation and Demodulation

    clc;
	close all;
	clear all;
	m=1;
	Am=5;
	fm=10;
	Tm=1/fm;
	t=0:Tm/100:6*Tm;
	ym=Am*cos(2*pi*fm*t);
    
	subplot(4,1,1); 
	plot(t,ym)
	title ( 'Modulating Signal');
	xlabel ( ' time (sec) ');
	ylabel (' Amplitude (volt)   ');
	% carrier frequency
	Ac=Am/m;
	fc=fm*10;
	Tc=1/fc;
	yc=Ac*cos(2*pi*fc*t);
	subplot(4,1,2);
	plot(t,yc), grid on;
	title ( '  Carrier Signal');
	xlabel ( ' time(sec) ');
	ylabel (' Amplitude (volt)');

% for DSBSC Modulation
% ym=Am*cos(2*pi*fm*t);
% yc=Ac*cos(2*pi*fc*t);
	y=ym.*yc;
	subplot(4,1,3);
	plot(t,y);
	hold on;
	plot(t,Ac*(ym));
	hold on;
	plot (t,-Ac*(ym));
	axis;
	title ( 'DSBSC Modulated wave ');
	xlabel ( ' time(sec) ');
	ylabel (' Amplitude (volt) ');
	grid on;
    
	% For DSBSC Demodulation
% ym=Am*cos(2*pi*fm*t);
% yc=Ac*cos(2*pi*fc*t);
	z=y.*yc;
	subplot(4,1,4);
	plot(t,z);
	title ( 'DSBSC Demodulated wave ');
	xlabel ( ' time(sec) ');
	ylabel (' Amplitude (volt) ');