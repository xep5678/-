clc
clear
close all

%输入信号
%输入狗和豚鼠的信号
Fs = 1000; 
T=1/Fs;                  
L=1000;
t=(0:L-1)*T;             
y=(250*t-24.32).*(heaviside(t-0.0975)-heaviside(t-0.1075))+(-250*t+29.38).*(heaviside(t-0.1075)-heaviside(t-0.1175))+(400*t-30).*(heaviside(t-0.075)-heaviside(t-0.0775))+(-400*t+32).*(heaviside(t-0.0775)-heaviside(t-0.08));
figure(1)
subplot(211)
plot(t,y)
y=y*1000;

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


%单边傅里叶变换
%NFFT=2^nextpow2(L); 
NFFT=L;
Y=fft(y,NFFT)/L;             
f=Fs/2*linspace(0,1,NFFT/2+1);
figure(3)
subplot(311)
plot(f,2*abs(Y(1:NFFT/2+1)))  
xlabel('频率 (Hz)')
ylabel('幅值')
grid on


%保留中间信号
subplot(312)
A=2*abs(Y(1:NFFT/2+1)).*(abs(H)');
plot(f,A)  
axis([0,100,0,35])
zuida=max(A);
yuzhi=zuida/100;
k=find(A<=yuzhi)
a=length(k);
for i=1:a
    if k(i)>=30
        bw=k(i);
        break;
    end
end
[peaks,locs]=findpeaks(-A);
a=length(locs);
for i=1:a
    if locs(i)>=30
        huan=locs(i);
        break;
    end
end
if huan<bw
    bw=huan;
end
bw
%做ifft
for i=1:L-(NFFT/2+1)
A(1,((NFFT/2+1)+i))=A(1,((NFFT/2+1)-i));
end

z=A.*exp(1i*angle(Y));
z2=real(ifft(z));
figure(4)
plot(t,z2*NFFT/2)

