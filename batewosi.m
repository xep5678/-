N=2;
Wn=[0.0671,0.0951];
[z,p,k] = butter(N,Wn);
sos = zp2sos(z,p,k);
freqz(sos,512,1000)
title(sprintf('n = %d Butterworth Lowpass Filter',N))