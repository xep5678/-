syms w

[w,params,conds]=solve((2*exp(-(w*3i)/25)*(pi*dirac(w) - 1i/w))/125 + (exp(-(w*3i)/25)*(pi*dirac(1, w) + 1i/w^2)*943i)/10 + (17*exp(-(w*19i)/100)*(pi*dirac(w) - 1i/w))/1000 + (exp(-(w*19i)/100)*(pi*dirac(1, w) + 1i/w^2)*943i)/10 - (33*exp(-(w*31i)/200)*(pi*dirac(w) - 1i/w))/1000 - (exp(-(w*31i)/200)*(pi*dirac(1, w) + 1i/w^2)*943i)/5==0,'ReturnConditions', true) 