# ref:https://core.ac.uk/download/pdf/234629502.pdf
# -- sample parameters
# St = 95
# K = 100
# r = 0.03
# YTM = 1
# t = 0.8
# sig = 0.02

# delta
delta <- function(St,K,r,YTM,t,sig){
  # d1, d2
  d1 = (log(St/K) + (r+1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  d2 = (log(St/K) + (r-1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  
  # delta
  Delta = pnorm(d1)
  return (Delta)
}

# gamma
gamma <- function(St,K,r,YTM,t,sig){
  # d1, d2
  d1 = (log(St/K) + (r+1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  d2 = (log(St/K) + (r-1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  
  Gamma = dnorm(d1)/(sig*St*sqrt(YTM-t))
  return (Gamma)
}

# Vega
vega <- function(St,K,r,YTM,t,sig){
  # d1, d2
  d1 = (log(St/K) + (r+1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  d2 = (log(St/K) + (r-1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  
  Vega = St*sqrt(YTM-t)*dnorm(d1)
  return (Vega)
}

# Theta
theta <- function(St,K,r,YTM,t,sig){
  # d1, d2
  d1 = (log(St/K) + (r+1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  d2 = (log(St/K) + (r-1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  
  Theta = -(St*dnorm(d1)*sig)/(2*sqrt(YTM-t)) - r*K*exp(-r*(YTM-t))*pnorm(d2)
  return (Theta)
}

# Rho
rho <- function(St,K,r,YTM,t,sig){
  # d2
  d2 = (log(St/K) + (r-1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  
  Rho = (YTM-t)*K*exp(-r*(YTM-t))*pnorm(d2)
  return (Rho)
}

# Price
price <- function(St,K,r,YTM,t,sig){
  # d1, d2
  d1 = (log(St/K) + (r+1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  d2 = (log(St/K) + (r-1/2*sig^2)*(YTM-t))/(sig*sqrt(YTM-t))
  
  Pi = St*pnorm(d1) - K*exp(-r*(YTM-t))*pnorm(d2)
  return (Pi)
}

# generate graph

## for delta
### Delta: 更改St, 控制sig等级
St=seq(from=80,to=120,by=1);K=100;r=0.03;YTM=1;t=0;sig=0.01
Delta=delta(St,K,r,YTM,t,sig)
Price=price(St,K,r,YTM,t,sig)
sig=0.03
Delta2=delta(St,K,r,YTM,t,sig)
Price2=price(St,K,r,YTM,t,sig)
sig=0.1
Delta3=delta(St,K,r,YTM,t,sig)
Price3=price(St,K,r,YTM,t,sig)
par(mfrow=c(1,2))
plot(St,Delta,type="l",col="red")
lines(St,Delta2,type="l",col="blue")
lines(St,Delta3,type="l")
legend("bottomright",legend=c("sig=0.01","sig=0.03","sig=0.1"),
       lwd=1,col=c("red","blue","black"))
plot(St,Price,type="l",col="red")
lines(St,Price2,type="l",col="blue")
lines(St,Price3,type="l")
legend("topleft",legend=c("sig=0.01","sig=0.03","sig=0.1"),
       lwd=1,col=c("red","blue","black"))

