clear

%输入信号
Fs=1000;
T=1/Fs;
L=1000;
t=(0:L-1)*T;
y=0.7*cos(2*pi*40*t)+sin(2*pi*200*t);
figure(1)
subplot(211)
plot(t,y)
grid on

%单边傅里叶变换
NFFT=L;
Y=fft(y,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);
subplot(212)
plot(f,2*abs(Y(1:NFFT/2+1)))
xlabel('频率(HZ)')
ylabel('幅度')

%构建带通滤波器
fn=1002;
fp=[38,42];
fs=[23,57];
Rp=2;
As=15;
Wp=fp/(fn/2);
Ws=fs/(fn/2);
[n,Wn]=buttord(Wp,Ws,Rp,As);
[b,a]=butter(n,Wn);
[H,F]=freqz(b,a,501,1002);
figure(2)
subplot(311)
plot(F,20*log10(abs(H)))
axis([0,400,-30,3])
xlabel('HZ');ylabel('幅度')
grid on 
subplot(312)
pha=angle(H)*180/pi;
plot(F,pha)
xlabel('HZ');ylabel('相位')

%保留中间信号
A=2*abs(Y(1:NFFT/2+1)).*(abs(H)');
subplot(313)
plot(f,A)
grid on

for i=1:L-(NFFT/2+1)
A(1,((NFFT/2+1)+i))=A(1,((NFFT/2+1)-i));
end

z=A.*exp(1i*angle(Y));
z2=real(ifft(z));
figure(3)
subplot(2,1,1)
y=0.7*cos(2*pi*100*t)+sin(2*pi*200*t);
plot(t,y)
subplot(2,1,2)
plot(t,z2*NFFT/2)
obw(z2*NFFT/2,[],[0 1]*pi,99)
bw2=obw(z2*NFFT/2,[],[0 1]*pi,99)/pi














