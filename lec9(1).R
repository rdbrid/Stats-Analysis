library(scatterplot3d)
library(MASS)
library(car)

ex2<-read.table(file="C:/wangqin/STAT 641/R-code/heatingoil.txt", header=F)
ex2

oilusage<-ex2[,1]
temp<-ex2[,2]
insulation<-ex2[,3]

par(mfrow=c(1,2))
plot(oilusage~temp)
plot(oilusage~insulation)

heat.lm <- lm(oilusage ~ temp+insulation)
summary(heat.lm)
coef(heat.lm)
confint(heat.lm)

anova(heat.lm)

anova(lm(oilusage~insulation+temp))
anova(lm(oilusage~temp))
anova(lm(oilusage~insulation))

summary(lm(oilusage~temp))
summary(lm(oilusage~insulation))

drop1(heat.lm, ~., test="F")

cbind(temp, insulation, oilusage, fitted(heat.lm), residuals(heat.lm))

# model with interaction #
model2<-lm(oilusage ~ temp*insulation)
# model2 <- lm(oilusage ~ temp + insulation +temp:insulation)

summary(model2)
anova(model2)



## Residual Diagnostics  ###

s3d <- with(ex2, scatterplot3d(temp, insulation, oilusage, pch = 16, highlight.3d = TRUE, angle = 30))
s3d$plane3d(heat.lm)


shapiro.test(residuals(heat.lm))
qqnorm(residuals(heat.lm))

sres <- rstandard(heat.lm)
sres[which(abs(sres) > 2)]

sdelres <- rstudent(heat.lm)

cbind[residuals(heat.lm), rstandard(heat.lm), rstudent(heat.lm)]

par(mfrow=c(1,2))
plot(sres)
plot(sdelres)

leverage <- hatvalues(heat.lm)
leverage[which(leverage > 4/15)]


cooksD <- cooks.distance(heat.lm)
influence.measures(heat.lm)

par(mfrow = c(2, 2))
plot(heat.lm)

plot(residuals(heat.lm))


vif(heat.lm)



influencePlot(heat.lm)
leveragePlots(heat.lm)







### Boston Housing Data Analysis ###
head(Boston)
attach(Boston)

plot(Boston)
pairs(Boston)

lstat2<-lstat^2
summary(lm(medv~lstat))
summary(lm(medv~lstat+lstat2))


boston.lm <- lm(medv ~ crim + indus + rm + age + dis + rad + tax + lstat)
summary(boston.lm)

anova(boston.lm)

summary(lm(medv~age))

vif(boston.lm)



X<-cbind(crim, indus, rm, dis, age, tax, lstat)
cor(X)

pairs(X)

par(mfrow = c(2, 2))
plot(boston.lm)


boston2.lm <- lm(log(medv) ~ crim + indus + rm + age + dis + rad + tax + lstat)
summary(boston2.lm)

anova(boston2.lm)


par(mfrow = c(2, 2))
plot(boston2.lm)


boston3.lm <- lsfit(X, log(medv))
ls.print(boston3.lm)

boston.diag <- ls.diag(boston3.lm)
leverage <- boston.diag$hat
sort(leverage)[-(1:500)]

sort(boston.diag$cooks)[-(1:500)]




boston4.lm <- lm(log(medv) ~ (crim + indus + rm + age + dis + rad + tax + lstat)^2)
summary(boston4.lm)



###  VIF for Multicollinearity  ###

ftc<-read.table(file="C:/wangqin/STAT 641/R-code/ftc2.dat", header=F)
ftc

tar <- ftc[,1]
nicotine <- ftc[ ,2]
weight<-ftc[, 3]
co<-ftc[,4]

X<-cbind(tar, nicotine, weight)

cor(X)


ftc.lm<-lm(co~tar+nicotine+weight)
summary(ftc.lm)
anova(ftc.lm)


summary(lm(co~nicotine))
summary(lm(co~tar))
summary(lm(co~weight))

vif(ftc.lm)

par(mfrow = c(2, 2))
plot(ftc.lm)


bodyfat<-read.table(file="C:/wangqin/STAT 641/R-code/bodyfat.txt", header=T)
bodyfat

bodyfat.lm<-lm(fat~skinfold+thigh+midarm, data=bodyfat)
summary(bodyfat.lm)
anova(bodyfat.lm)

attach(bodyfat)
X<-cbind(skinfold, thigh, midarm)

cor(X)

vif(bodyfat.lm)

par(mfrow = c(2, 2))
plot(bodyfat.lm)



