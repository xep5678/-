clear
%狗
syms m
Fs=160;%采样频率100Hz
f1=15;
f2=20;
t=0:1/Fs:10-1/Fs % 0-9.99s 一共1000个点
m=0:0.1/Fs:0.4-0.1/Fs 
y=(125*t-12.19).*(heaviside(t-0.0975)-heaviside(t-0.1175))+(-125*t+17.189).*(heaviside(t-0.1175)-heaviside(t-0.1375));
ft=(125*m-12.19).*(heaviside(m-0.0975)-heaviside(m-0.1175))+(-125*m+17.189).*(heaviside(m-0.1175)-heaviside(m-0.1375));
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

