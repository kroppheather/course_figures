
#y scatter for illustration
set.seed(322)
y.vis <- rnorm(30,0,0.5)


set.seed(3322)
trueMean <- 32
#high accuracy & precision
x.high <- rnorm(30, trueMean,0.1)
#low accuracy & precision
set.seed(3284)
x.low <- rnorm(30, trueMean + rnorm(1,25,5),
               15)

#low accuracy & high precision
set.seed(34)
x.lowa <- rnorm(30, trueMean + rnorm(1,10,5),
               0.1)

#high accuracy & low precision
set.seed(6)
x.lowp <- rnorm(30, trueMean,15)

par(mfrow=c(2,2))
#high accuracy, high precision
plot(x.high,y.vis, pch=19, ylim=c(-1.25,1.25),
     xlim=c(31,33),
     ylab =" ",
     axes=FALSE,
     xlab="Range of x variable",
     col=rgb(0.5,0.5,0.5,0.5))
abline(v=trueMean, col="tomato3")
points(mean(x.high), 0, pch=19, col="royalblue3")
axis(1, seq(0,100,by=1))

legend("topleft",
       c("True mean","Sample mean", "Data"),
       lwd=c(1,NA,NA),
       pch=c(NA,19,19),
       col=c("tomato3","royalblue3",rgb(0.5,0.5,0.5,0.5)),
       bty="n")
#high accuracy low precision
plot(x.lowp,y.vis, pch=19, ylim=c(-1.25,1.25),
     xlim=c(0,100),
     ylab =" ",
     axes=FALSE,
     xlab="Range of x variable",
     col=rgb(0.5,0.5,0.5,0.5))
abline(v=trueMean, col="tomato3")
points(mean(x.lowp), 0, pch=19, col="royalblue3")
axis(1, seq(0,100,by=20))

#low accuracy, high precision

plot(x.lowa,y.vis, pch=19, ylim=c(-1.25,1.25),
     ylab =" ",
     axes=FALSE,
     xlim=c(30,45),
     xlab="Range of x variable",
     col=rgb(0.5,0.5,0.5,0.5))
abline(v=trueMean, col="tomato3")
points(mean(x.lowa), 0, pch=19, col="royalblue3")
axis(1, seq(0,100,by=10))
#low accuracy and precision
plot(x.low,y.vis, pch=19, ylim=c(-1.25,1.25),
     ylab =" ",
     axes=FALSE,
     xlim=c(10,115),
     xlab="Range of x variable",
     col=rgb(0.5,0.5,0.5,0.5))
abline(v=trueMean, col="tomato3")
points(mean(x.low), 0, pch=19, col="royalblue3")
axis(1, seq(0,100,by=20))


temp.fix <- ifelse(air.temp <= -30, air.temp, NA)

