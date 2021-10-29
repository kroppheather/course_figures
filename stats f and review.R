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
ysub <- yplot[xplot >= 2.5]
polygon(c(xsub,rev(xsub)),
        c(ysub,rep(0,length(ysub))),
        col="tomato3")

1-pf(2.5,3,(50*4)-1)

1-pf(4.898,3,236)

simANOVA <- group
library(ggplot2)

set.seed(12)
bigF <- data.frame(data=c(rnorm(50,15,5),rnorm(50,25,5),rnorm(50,45,5),rnorm(50,32,5)), 
                   groups=as.factor(c(rep("group 1",50),rep("group 2",50),rep("group 3",50),rep("group 4",50))),
                   jitter=c(rnorm(50,1,0.1),rnorm(50,2,0.1),rnorm(50,3,0.1),rnorm(50,4,0.1)))

meansBG <- tapply(bigF$data,bigF$groups,"mean")
meanB <- mean(bigF$data)

ggplot(bigF, aes(x=groups,y=data)) + 
  geom_boxplot(fill="grey75")+
  theme_classic()+
  geom_point(data=data.frame(x=seq(1,4), y=meansBG[1:4]),
             aes(x=x,y=y), col="tomato3",size=3)+
  geom_line(data=data.frame(x=seq(0,5), y=rep(meanB,6)),
            aes(x=x,y=y), col="royalblue2")+
  geom_point(data=bigF,aes(x=jitter,y=data),
             col=rgb(0.1,0.1,0.1,0.5),size=0.5)

mod <- lm(bigF$data ~ bigF$groups)
aov.mod <- aov(mod)
summary(aov.mod)

modPH <- TukeyHSD(aov.mod)
modPH
plot(modPH)

