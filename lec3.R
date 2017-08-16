
## Binomial Random Variable  ##
 dbinom(0, size=12, prob=1/6)
 dbinom(1, size=12, prob=1/6)

 pbinom(1, size=12, prob=1/6)

 diff(pbinom(c(1,5), size = 12, prob = 1/6))


 rbinom(5, size = 12, prob = 1/6)

 par(mfrow=c(3,2))
 hist(rbinom(10000, size = 12, prob = 1/6), breaks = c(0:12))
 hist(rbinom(10000, size = 12, prob = 1/4), breaks = c(0:12))
 hist(rbinom(10000, size = 12, prob = 1/2), breaks = c(0:12))
 hist(rbinom(10000, size = 12, prob = 3/4), breaks = c(0:12))
 hist(rbinom(10000, size = 12, prob = 5/6), breaks = c(0:12))



## Geometric Random Variable  ##

 dgeom(1, 1/4)
 dgeom(3, 1/4)
 dgeom(3, 1/2)

 par(mfrow=c(2,2))
 hist(rgeom(10000, prob = 1/6))
 hist(rgeom(10000, prob = 1/4))
 hist(rgeom(10000, prob = 1/2))
 hist(rgeom(10000, prob = 3/4))



## Negative Binomial Random Variable  ##
 dnbinom(4-2,2,1/4)  # dnbinom(y-k,k,p)

 dnbinom(4-1,1,1/4)



## Hypergeometric RV ##
 dhyper(y,r,N-r,n)



## Poisson RV  ##
 dpois(y,?)

 dpois(3, 2.5)

 par(mfrow=c(2,2))
 hist(rpois(10000, 1))
 hist(rpois(10000, 2))
 hist(rpois(10000, 4))
 hist(rpois(10000, 10))





