library(IPSUR)
library(ISwR)


## charts  ##
beer = c(3, 4, 1, 1, 3, 4, 3, 3, 1, 3, 2, 1, 2, 1, 2, 3, 2, 3, 1, 1, 1, 1, 4, 3, 1)

beer

par(mfrow=c(3,1))
barplot(table(beer))
barplot(table(beer)/length(beer))


beer.counts = table(beer) 
names(beer.counts) = c("domestic\n can","Domestic\n bottle", "Microbrew","Import")
pie(beer.counts, col=c("purple","green2","cyan","white"))



## numerical measure ##
precip

summary(precip)
quantile(precip,c(.25, .50, .75))
IQR(precip)

hist(precip)



scores = scan()
2 3 16 23 14 12 4 13 2 0 0 0 6 28 31 14 4 8 2 5

summary(scores)
quantile(scores,c(.25, .50, .75))
IQR(scores)

stem(scores)
hist(scores)
hist(scores, probability=TRUE)

boxplot(scores)
boxplot(scores, main="scores",horizontal=TRUE)


salarydata<-read.table(file="C:/wangqin/STAT 641/R-code/salary.txt", header=F)
attach(salarydata)
gender<-salarydata[,2]
salary<-salarydata[,4]

summary(salary)

par(mfrow=c(3,1))
hist(salary)
hist(salary, freq=FALSE)
hist(salary, breaks=20)

boxplot(salary)

mean(salary)
sd(salary)
var(salary)

quantile(salary)

quantile(salary,(1:10)/10)

qqnorm(salary)


tapply(salary, gender, mean)
tapply(salary, gender, sd)

boxplot(salary~gender)


