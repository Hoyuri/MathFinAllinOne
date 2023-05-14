# -- parameters
St = 95
K = 100
r = 0.03
YTM = 1
t = 0.8
sig = seq(from=0.001,to=0.2,by=0.001)

# -- price
d1 = (log(St/K) + (r+1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
d2 = (log(St/K) + (r-1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))

Pi = St*pnorm(d1) - K*exp(-r*(YTM-t))*pnorm(d2)

# plot
# plot(St,Pi,type="l")

# -- Greek
# delta
Delta = pnorm(d1)
# plot
# plot(St,Delta,type="l")

# gamma
Gamma = dnorm(d1)/(sig*St*sqrt(YTM-t))
# plot
# plot(St,Gamma,type="l")

# Venna
Venna = St*sqrt(YTM-t)*dnorm(d1)
plot(sig,Venna,type="l")