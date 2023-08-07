clear
%豚鼠(2)
syms m
Fs=500;%采样频率100Hz
f1=15;
f2=20;
t=0:1/Fs:10-1/Fs; % 0-9.99s 一共1000个点
m=0:1/Fs:0.2-1/Fs;
y=(133.3*t-10).*(heaviside(t-0.075)-heaviside(t-0.0825))+(-133.3*t+12).*(heaviside(t-0.0825)-heaviside(t-0.09));
ft=(133.3*m-10).*(heaviside(m-0.075)-heaviside(m-0.0825))+(-133.3*m+12).*(heaviside(m-0.0825)-heaviside(m-0.09));
N=length(ft);
f=(0:N-1)*Fs/N;
subplot(1,2,1)
plot(m,ft)
k=abs(fft(ft));
subplot(1,2,2)
plot(f,k)
[peaks,locs]=findpeaks(-k);%寻找极小值
bw=locs(1)*Fs/N
panduan(bw)