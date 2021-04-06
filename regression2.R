
x <- rnorm(30,50,25)

example <- rnorm(30,0+1*x,10)
example2 <- rnorm(30,0+2*x,10)

plot(x,example, pch=19,
     xlab="independent variable",
     ylab="dependent variable",
     ylim=c(0,200))
points(x,example2, pch=19,col="tomato3")

fit1 <- lm(example ~ x)
fit2 <- lm(example2 ~ x)

abline(fit1)
text(0,100, "slope = 1")
abline(fit2, col="tomato3")
text(0,150, "slope = 2", col="tomato3")
