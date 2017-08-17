

## Normal distribution  ##
 
 pnorm(-1, 0, 1)
 pnorm( 1, 0, 1)
 
 pnorm( 1, 0, 1) - pnorm(-1, 0, 1)
 pnorm( 2, 0, 1) - pnorm(-2, 0, 1)
 pnorm( 3, 0, 1) - pnorm(-3, 0, 1)

 qnorm(0.95, 0, 1)
 qnorm(0.05, 0, 1)


 par(mfrow=c(2,2))
 hist(rnorm(10000, 0, 0.5), breaks = c(-6:6))
 hist(rnorm(10000, 0, 1), breaks = c(-6:6))
 hist(rnorm(10000, 0, 2), breaks = c(-9:9))
 hist(rnorm(10000, 2, 1), breaks = c(-6:6))

 qqnorm(rnorm(10000, 2, 2))


 salarydata<-read.table(file="C:/wangqin/STAT 641/R-code/salary.txt", header=F)
 attach(salarydata)
 salary<-salarydata[,4]

 par(mfrow=c(2,2))
 boxplot(salary)
 qqnorm(salary)
 qqnorm(log(salary))
 qqnorm(sqrt(salary))
 shapiro.test(salary)

 precip
 boxplot(precip)
 qqnorm(precip)
 shapiro.test(precip)


 diff(pbinom(c(0, 199), size = 600, prob = 0.345))
 pnorm(-0.64, 0, 1)
