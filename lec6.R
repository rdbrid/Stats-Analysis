library(IPSUR)
library(ISwR)
library(MASS)
library(Hmisc)

### Confidence interval simulation  ###

library(TeachingDemos)

##  normal with mean 100 and sd 10)
ci.examp()

par(mfrow=c(2,1))
ci.examp(mean.sim = 100, sd = 10, n = 25, reps = 50, conf.level=0.9)
ci.examp(mean.sim = 100, sd = 10, n = 25, reps = 50, conf.level=0.95)
ci.examp(mean.sim = 100, sd = 10, n = 25, reps = 50, conf.level=0.99)




### 1-sample t-CI   ####

precip

summary(precip)
sd(precip)

t.test(precip, conf.level=0.95)

t.test(precip, conf.level=0.95)$conf.int
t.test(precip, conf.level=0.90)$conf.int
t.test(precip, conf.level=0.99)$conf.int



survey
height0<-na.omit(survey$Height)
length(height0)

qqnorm(height0)
t.test(height0, conf.level=0.95)$conf.int



### normal transformation  ####
Cars93
hpr<-Cars93$Horsepower

qqnorm(hpr)
qqnorm(log(hpr))

t.test(hpr, conf.level=0.95)$conf.int

exp(t.test(log(hpr), conf.level=0.95)$conf.int)





### 2-sample t-CI   ####
nonsmokers = c(18,22,21,17,20,17,23,20,22,21)
smokers = c(16,20,14,21,20,18,13,15,17,21)

boxplot(nonsmokers,smokers,ylab="Scores on Digit Span Task",
         names=c("nonsmokers","smokers"),
         main="Digit Span Performance by\n Smoking Status")

t.test(nonsmokers,smokers, var.equal=T)

t.test(nonsmokers,smokers)



### CI for proportions  ###
survey
gender.response <- na.omit(survey$Sex)
n <- length(gender.response)
k <- sum(gender.response == "Female" )

prop.test(k, n, conf.level=0.95, correct=FALSE)

 # alternative function
 
binconf(k, n, method="asymptotic")

binconf(k, n, method="wilson")

# example in lecture notes #
prop.test(146, 200,  conf.level=0.95, correct=FALSE)

binconf(146, 200, method="asymptotic")    # this is the result in the notes



## example showing difference between Wald and Score CI  ##
prop.test(1, 10, conf.level=0.95, correct=FALSE)

binconf(1, 10, method="asymptotic")

binconf(1, 10, method="wilson")

binconf(1, 10, method="exact")

## difference of two population proportions ##

prop.test(x=c(92, 240), n=c(200, 500), conf.level=0.99, correct=FALSE)

prop.test(x=c(92, 240), n=c(200, 500), conf.level=0.90, correct=FALSE)




