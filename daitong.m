wp=[38,42]/500;
ws=[23,57]/500;
Rp=1;
As=13;
[N,wc] = buttord(wp, ws, Rp, As)  
[B,A]=butter(N,wc)

