dt=0.01;%采样间隔
N=1024;%采样点数
t=0:dt:(N-1)*dt;%采样时刻
fs=1/dt;%采样频率，与才采样间隔互为倒数
n=0:1:N-1;
f=(fs/N).*n;%X轴每个点对应的频率
x=cos(2*pi*5*t);%信号
figure(1)
plot(t,x)
y=fft(x);%傅里叶变换得到一个复数
Ay=abs(y);%取模
Ayy=Ay*2/N;%转换成实际的幅值
figure(2)
plot(f(1:N/2),Ayy(1:N/2))

wp=[38,42]/500;
ws=[23,57]/500;
Rp=1;
As=13;
[N,wc] = buttord(wp, ws, Rp, As);
[B,A]=butter(N,wc);

x=filter(B,A,x);
y=fft(x);
Ay=abs(y);%取模
Ayy=Ay*2/N;%转换成实际的幅值
figure(3)
plot(f(1:N/2),Ayy(1:N/2))