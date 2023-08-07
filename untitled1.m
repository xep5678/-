clear
syms m
syms w
t=0:0.01:1;% 0-9.99s 一共1000个点
ft=(165*m-19.8).*(heaviside(m-0.12)-heaviside(m-0.14))+(-165*m+26.4).*(heaviside(m-0.14)-heaviside(m-0.16));
y=abs(fourier(ft));
ezplot(y,[0,700]);



