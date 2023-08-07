clear
syms w
f=(2*exp(-(w*3i)/25)*(pi*dirac(w) - 1i/w))/125 + (exp(-(w*3i)/25)*(pi*dirac(1, w) + 1i/w^2)*943i)/10 + (17*exp(-(w*19i)/100)*(pi*dirac(w) - 1i/w))/1000 + (exp(-(w*19i)/100)*(pi*dirac(1, w) + 1i/w^2)*943i)/10 - (33*exp(-(w*31i)/200)*(pi*dirac(w) - 1i/w))/1000 - (exp(-(w*31i)/200)*(pi*dirac(1, w) + 1i/w^2)*943i)/5
k=abs(f)-0.001;
t=0:0.0001:30;
y=(94.3*t-11.3).*(heaviside(t-0.12)-heaviside(t-0.155))+(-94.3*t+17.9).*(heaviside(t-0.155)-heaviside(t-0.19));
bw=obw(y)