clear
%狗(2)
syms m
Fs=260;%采样频率100Hz
f1=15;
f2=20;
t=0:1/Fs:10-1/Fs % 0-9.99s 一共1000个点
m=0:0.1/Fs:0.4-0.1/Fs 
y=(250*t-24.32).*(heaviside(t-0.0975)-heaviside(t-0.1075))+(-250*t+29.38).*(heaviside(t-0.1075)-heaviside(t-0.1175));
ft=(250*m-24.32).*(heaviside(m-0.0975)-heaviside(m-0.1075))+(-250*m+29.38).*(heaviside(m-0.1075)-heaviside(m-0.1175));
N=length(y);
f=(0:N-1)*Fs/N;
subplot(1,2,1)
plot(m,ft)
xlabel('s')
ylabel('狗')
k=abs(fft(y));
subplot(1,2,2)
plot(f,k)
[peaks,locs]=findpeaks(-k);%寻找极小值
bw=locs(1)*Fs/N
panduan(bw)
