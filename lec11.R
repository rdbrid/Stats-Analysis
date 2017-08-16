library(MASS)

rating <- c(35, 50, 25, 55, 10, 30, 20, 45, 60, 40, 90,65, 85, 95)
software <- c(rep("1",7), rep("2",7))
example1 <- data.frame(rating, software)

wilcox.test(rating[1:7], rating[8:14]) 

wilcox.test(rating~software, data=example1)