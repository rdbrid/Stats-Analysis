
## t-test  ##
mpg <- c(11.4,13.1,14.7,14.7,15.0,15.5,15.6,15.9,16.0,16.8)

xbar <- mean(mpg)
s <- sd(mpg)
n <- length(mpg)


t.test(mpg, mu = 17, alt="less")


t.test(mpg, mu = 17)


t.test(mpg, mu = 14, alt="greater")

# check normality assumption  #
qqnorm(mpg)



## 2-sample test ##
x <- c(284, 279, 289, 292, 287, 295, 285, 279, 306, 298)
y <- c(298, 307, 297, 279, 291, 335, 299, 300, 306, 291)

t.test(x, y, var.equal=TRUE)

t.test(x, y, var.equal=TRUE, alt="less")

# welch test  #
t.test(x, y)

t.test(x, y, alt="less" )



# matched-pair  #
x <- c(5,3,5,6,4,4,7,4,3)
y <- c(2,3,2,4,2,2,3,4,2)


t.test(x, y, paired=TRUE)


t.test(x, y, paired=TRUE, alt="greater")




## Bootstrap inference
library(boot)

mpg <- c(11.4,13.1,14.7,14.7,15.0,15.5,15.6,15.9,16.0,16.8)
hist(mpg)

xbar <- mean(mpg)
s <- sd(mpg)
n <- length(mpg)

t.test(mpg, mu = 17)


b <- boot(mpg, function(u,i) mean(u[i]), R = 1000)
boot.ci(b, type = c("norm", "basic", "perc"))


# bootstrap p_value
t.test(mpg, mu = 17, alt="less")

t1<-(mean(mpg) - 17)/(sd(mpg)/sqrt(10))

   btp <- array(0,1000,1)
   for (i in 1:1000) {
      si <- sample(mpg, replace=T)
      btp[i] <- (mean(si)-xbar)/(sd(si)/sqrt(n))
   }


summary(btp)
length(btp[btp<t1])/1000



t.test(mpg, mu = 14, alt="greater")

t2<-(mean(mpg) - 14)/(sd(mpg)/sqrt(10))

   btp <- array(0,1000,1)
   for (i in 1:1000) {
      si <- sample(mpg, replace=T)
      btp[i] <- (mean(si)-xbar)/(sd(si)/sqrt(n))
   }


summary(btp)
length(btp[btp>t2])/1000

