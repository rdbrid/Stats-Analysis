
## Example #1  ##

x<-c(1903, 1821, 1761, 1979, 2048, 2288, 2592)
y<-c(13, 11, 9, 10, 6, 5, 3)
n<-length(y)

plot(x, y)

ex1.lm<-lm(y~x)
summary(ex1.lm)

coef(ex1.lm)
confint(ex1.lm)


plot(y~x, pch=16)
abline(coef(ex1.lm))


sse<-sum(residuals(ex1.lm)^2)
sse
sigma2_hat<-sse/(n-2)


cbind(x, y, fitted(ex1.lm), residuals(ex1.lm))

anova(ex1.lm)







# Example  #
cars
dim(cars)


head(cars)  # only the first few observations


plot(dist ~ speed, data = cars)

cars.lm <- lm(dist ~ speed, data = cars)
summary(cars.lm)
coef(cars.lm)
confint(cars.lm)

plot(dist ~ speed, data = cars, pch = 16)
abline(coef(cars.lm))

cbind(cars$speed, cars$dist, fitted(cars.lm))


anova(cars.lm)


shapiro.test(residuals(cars.lm))
qqnorm(residuals(cars.lm))

sres <- rstandard(cars.lm)
sres[which(abs(sres) > 2)]

sdelres <- rstudent(cars.lm)


leverage <- hatvalues(cars.lm)
leverage[which(leverage > 4/50)]
