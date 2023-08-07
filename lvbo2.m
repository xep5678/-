clear
fs=512;
t=0:1/fs:1-1/fs;
x=cos(2*pi*100*t);
f=fftshift(fft(x));  
w=linspace(-512/2,512/2,length(x));  %根据奈奎斯特采样定理，512/2为最大频率
plot(w,abs(f));                      %Hz为单位
