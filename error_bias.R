
#y scatter for illustration
set.seed(322)
y.vis <- rnorm(30,0,1)


set.seed(3322)
trueMean <- 32
#high accuracy & precision
x.high <- rnorm(30, trueMean,0.1)
#low accuracy & precision
set.seed(3284)
x.low <- rnorm(30, trueMean + rnorm(1,15,5),
               15)

#low accuracy & high precision
set.seed(34)
x.lowa <- rnorm(30, trueMean + rnorm(1,15,5),
               0.1)

plot(x.high,y.vis, pch=19, ylim=c(-3,3),
     xlim=c(25,35),
     ylab =" ",
     axes=FALSE,
     xlab="Range of x variable",
     col=rgb(0.5,0.5,0.5,0.5))
points(trueMean, 0, pch=19, col="tomato3")
points(mean(x.high), 0, pch=19, col="royalblue3")

plot(x.low,y.vis, pch=19, ylim=c(-3,3),
     ylab =" ",
     xlab="Range of x variable",
     col=rgb(0.5,0.5,0.5,0.5))
points(trueMean, 0, pch=19, col="tomato3")
points(mean(x.low), 0, pch=19, col="royalblue3")


plot(x.lowa,y.vis, pch=19, ylim=c(-3,3),
     ylab =" ",
     xlab="Range of x variable",
     col=rgb(0.5,0.5,0.5,0.5))
points(trueMean, 0, pch=19, col="tomato3")
points(mean(x.lowa), 0, pch=19, col="royalblue3")

