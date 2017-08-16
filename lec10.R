
### Example 1 CRD  ###
time <- c(25.40, 26.31, 24.10, 23.74, 25.10, 23.40, 21.80, 23.50, 22.75, 21.60, 20.00, 22.20, 19.75, 20.60, 20.40)
machine <- c(rep("1",5), rep("2",5), rep("3",5))
example1 <- data.frame(time, machine)

example1


plot(time~machine, data=example1)

anova1<-aov(time~machine, data=example1)
summary(anova1)

pairwise.t.test(time, machine, p.adjust="bonferroni")

TukeyHSD(anova1, conf.level = 0.95)




### Example 2 RBD  ###

tread1<-read.table(file="C:/wangqin/STAT 641/R-code/treadlife.txt", header=T)
tread1

attach(tread1)

car<-factor(car)
brand<-factor(brand)

par(mfrow=c(1,2))
plot(tread ~ car+brand)

anova(lm(tread ~ car + brand))

anova2<-aov(tread ~ car + brand)
summary(anova2)
TukeyHSD(anova2, conf.level = 0.95)

TukeyHSD(anova2, which=c("brand"), conf.level=.99)

plot(TukeyHSD(anova2, which=c("brand"), conf.level=.99))

pairwise.t.test(tread, brand, p.adjust="bonferroni")




