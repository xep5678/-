clear
%兔子(1)
syms m
Fs=220;%采样频率100Hz
f1=15;
f2=20;
t=0:1/Fs:10-1/Fs; % 0-9.99s 一共1000个点
m=0:0.1/Fs:0.4-0.1/Fs;
y=(14.7*t-1.1).*(heaviside(t-0.075)-heaviside(t-0.09))+(-14.7*t+1.54).*(heaviside(t-0.09)-heaviside(t-0.105));
ft=(14.7*m-1.1).*(heaviside(m-0.075)-heaviside(m-0.09))+(-14.7*m+1.54).*(heaviside(m-0.09)-heaviside(m-0.105));
N=length(y);
f=(0:N-1)*Fs/N;
subplot(1,2,1)
plot(m,ft)
k=abs(fft(y));
subplot(1,2,2)
plot(f,k)
[peaks,locs]=findpeaks(-k);%寻找极小值
bw=locs(1)*Fs/N
panduan(bw)





