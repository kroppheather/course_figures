iris


virginica <- iris[iris$Species == "virginica",]
mod <- lm(virginica$Petal.Length ~ virginica$Petal.Width)
plot(virginica$Petal.Width,virginica$Petal.Length, pch=19,
     col=rgb(.6,.6,.6,.5),
     xlab= "Petal Width",
     ylab="Petal Length")

abline(mod, lwd=2, col="tomato3")
summary(mod)

xplot <- seq(0,20, by=0.1)
yplot <- df(xplot,3,(50*4)-1)
yplot2 <- df(xplot,2,(15*3)-1)
yplot3 <- df(xplot,9,(25*9)-1)


plot(xplot, yplot, type="l", ylim=c(0,1),
     xlim=c(0,10),lwd=3,
     ylab="probability density",
     xlab="F values",
     col=rgb(0,0,0,.75))
points(xplot,yplot2, type="l",lwd=3, col=rgb(0.8,0.31,0.22,0.75))
points(xplot,yplot3, type="l",lwd=3, col=rgb(0.23,0.37,0.8,0.75))

legend("topright",
       c("Df1 = 3, Df2 = 199",
         "Df1 = 2, Df2 = 29",
         "Df1 = 9, Df2 = 224"),
       bty="n",
       col=c(rgb(0,0,0,.75),
             rgb(0.8,0.31,0.22,0.75),
             rgb(0.23,0.37,0.8,0.75) ),
       lwd=2)


plot(xplot, yplot, type="l", ylim=c(0,1),
     xlim=c(0,10),lwd=3,
     ylab="probability density",
     xlab="F values",
     col=rgb(0,0,0,.75))
abline(v=2.5, col="tomato3")
xsub <- xplot[xplot >= 2.5]
ysub <- yplot[yplot >= 2.5]
polygon()
1-pf(2.5,3,(50*4)-1)

