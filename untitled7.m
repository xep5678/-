% 两个频率分别为15HZ 和 20HZ 的正弦信号
Fs=50;%采样频率50Hz
f1=15;
f2=20;
t = 0:1/Fs:2-1/Fs % 0-9.98s 一共500个点
x = sin(2*pi*f1*t) + sin(2*pi*f2*t);%原始信号
N=length(x)% N=500
figure(1);
plot(t,x);
title('Original Signal');
xlabel('Time'); 
ylabel('Amplitude'); 
%直接使用fft
figure(2);
y0 =abs(fft(x)); %快速傅里叶变换的幅值
%将横坐标转化，显示为频率f= n*(fs/N)
f = (0:N-1)*Fs/N
plot(f,y0);
xlabel('Frequency'); 
