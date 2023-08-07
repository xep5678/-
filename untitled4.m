clear
%兔子(2)
syms m
Fs=300;%采样频率100Hz
f1=15;
f2=20;
t=0:1/Fs:10-1/Fs; % 0-9.99s 一共1000个点
m=0:0.1/Fs:0.4-0.1/Fs;
y=(29.3*t-2.18).*(heaviside(t-0.075)-heaviside(t-0.0825))+(-29.3*t+2.64).*(heaviside(t-0.0825)-heaviside(t-0.09));
ft=(29.3*m-2.18).*(heaviside(m-0.075)-heaviside(m-0.0825))+(-29.3*m+2.64).*(heaviside(m-0.0825)-heaviside(m-0.09));
N=length(y);
f=(0:N-1)*Fs/N;
subplot(1,2,1)
plot(m,ft)
k=abs(fft(y));
subplot(1,2,2)
plot(f,k)
[peaks,locs]=findpeaks(-k)%寻找极小值
