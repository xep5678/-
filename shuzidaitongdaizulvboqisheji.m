clc
clear
close all

%�����ź�
Fs = 1000; 
T=1/Fs;                  
L=1000;
t=(0:L-1)*T;             
y=0.7*cos(2*pi*100*t)+sin(2*pi*200*t)+0.4*sin(2*pi*40*t)+5*cos(2*pi*400*t); 
figure(1)
subplot(211)
plot(t,y)
grid on

%���߸���Ҷ�任
%NFFT=2^nextpow2(L); 
NFFT=L;
Y=fft(y,NFFT)/L;             
f=Fs/2*linspace(0,1,NFFT/2+1);
subplot(212)
plot(f,2*abs(Y(1:NFFT/2+1)))  
xlabel('Ƶ�� (Hz)')
ylabel('��ֵ')
grid on

%������ͨ�˲��� 
fn=1002;  
fp=[80,230];  
fs=[60,300];  
Rp=3;  
Rs=30;
Wp=fp/(fn/2);               %�����һ����Ƶ��
Ws=fs/(fn/2);
[n,Wn]=buttord(Wp,Ws,Rp,Rs);%��������ͽ�ֹƵ��
[b,a]=butter(n,Wn);         %����H(z)���ӡ���ĸ����ʽϵ��
%[H,F]=freqz(b,a,c,d);      %F�ļ������ d/(2*c)
[H,F]=freqz(b,a,501,1002);%����H(z)�ķ�Ƶ��Ӧ,freqz(b,a,�������,��������)  
figure(2)
subplot(311)
plot(F,20*log10(abs(H)))
axis([0 400 -30 3])
xlabel('Ƶ�� (Hz)'); ylabel('��ֵ(dB)') 
grid on
subplot(312)
pha=angle(H)*180/pi;
plot(F,pha)
xlabel('Ƶ�� (Hz)'); ylabel('��λ')
grid on

%�����м��ź�
A=2*abs(Y(1:NFFT/2+1)).*(abs(H)');
subplot(313)
plot(f,A)  
grid on

%��ifft
for i=1:L-(NFFT/2+1)
A(1,((NFFT/2+1)+i))=A(1,((NFFT/2+1)-i));
end

z=A.*exp(1i*angle(Y));
z2=real(ifft(z));
figure(3)
subplot(2,1,1)
y=0.7*cos(2*pi*100*t)+sin(2*pi*200*t);
plot(t,y);
subplot(2,1,2)
plot(t,z2*NFFT/2);



%���������˲���
fn=1002;  
fp=[60,300]; 
fs=[70,250];  
Rp=3;  
Rs=30;
Wp=fp/(fn/2);
%�����һ����Ƶ��
Ws=fs/(fn/2);
[n,Wn]=buttord(Wp,Ws,Rp,Rs);%��������ͽ�ֹƵ��
[b,a]=butter(n,Wn,'stop');%����H(z)���ӡ���ĸ����ʽϵ��
[H,F]=freqz(b,a,501,1002);%����H(z)�ķ�Ƶ��Ӧ,freqz(b,a,�������,��������)
figure(4)
subplot(311)
plot(F,20*log10(abs(H)))
axis([0 400 -35 3])
xlabel('Ƶ�� (Hz)'); ylabel('��ֵ(dB)')
grid on
subplot(312)
pha=angle(H)*180/pi;
plot(F,pha)
xlabel('Ƶ�� (Hz)'); ylabel('��λ')
grid on


%��ȥ�м��ź�
A=(2*abs(Y(1:NFFT/2+1))).*(abs(H)');
subplot(313)
plot(f,A)  
grid on

%��ifft
for i=1:L-(NFFT/2+1)
A(1,((NFFT/2+1)+i))=A(1,((NFFT/2+1)-i));
end

z=A.*exp(1i*angle(Y));
z2=real(ifft(z));
figure(5)
subplot(2,1,1)
y=0.4*sin(2*pi*40*t)+5*cos(2*pi*400*t);
plot(t,y);
subplot(2,1,2)
plot(t,z2*NFFT/2);



