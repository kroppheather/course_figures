setwd("c:\\Users\\hkropp\\Google Drive\\courses\\Spring2020\\Environmental Data Science\\figures")

#start with sampling example and demonstrate a histogram for a few samples
heights <- c(20,21,15,17,20)

hist1 <- hist(heights, breaks=seq(14,22))

plot(c(0,1),c(0,1), type="n", xlim=c(13,22), ylim=c(0,3), xaxs="i", yaxs="i",axes=FALSE,xlab=" ", ylab=" ")
for(i in 1:length(hist1$breaks)){
	polygon(c(hist1$breaks[i]-.25,hist1$breaks[i]-.25,hist1$breaks[i]+.25,hist1$breaks[i]+.25),
			c(0,hist1$counts[i],hist1$counts[i],0),col=rgb(108,166,205,maxColorValue=255),border=NA)
}

axis(1, seq(13,22),seq(13,22),cex=1.5)
axis(2, seq(0,3),seq(0,3),cex=1.5,las=2)
mtext("Tree height (m)", side=1, line=2.5, cex=1.5)
mtext("Number of observations",side=2,line=2,cex=1.5)

#now with sampling example and demonstrate a histogram for many more samples
#generate data
set.seed(305)
larchH <- rnorm(300,21,5)

histL <- hist(larchH, breaks=seq(0,40))



plot(c(0,1),c(0,1), type="n", xlim=c(0,40), ylim=c(0,35), xaxs="i", yaxs="i",axes=FALSE,xlab=" ", ylab=" ")
for(i in 1:length(histL$breaks)){
	polygon(c(histL$breaks[i]-.25,histL$breaks[i]-.25,histL$breaks[i]+.25,histL$breaks[i]+.25),
			c(0,histL$counts[i],histL$counts[i],0),col=rgb(108,166,205,maxColorValue=255),border=NA)
}

axis(1, seq(0,40,by=5),seq(0,40,by=5),cex=1.5)
axis(2, seq(0,35,by=5),seq(0,35,by=5),cex=1.5,las=2)
mtext("Tree height (m)", side=1, line=2.5, cex=1.5)
mtext("Number of observations",side=2,line=2,cex=1.5)


#show histogram with summary statistics
larchM <- mean(larchH)
larchSD <- sd(larchH)

#just with mean
plot(c(0,1),c(0,1), type="n", xlim=c(0,40), ylim=c(0,35), xaxs="i", yaxs="i",axes=FALSE,xlab=" ", ylab=" ")
for(i in 1:length(histL$breaks)){
	polygon(c(histL$breaks[i]-.25,histL$breaks[i]-.25,histL$breaks[i]+.25,histL$breaks[i]+.25),
			c(0,histL$counts[i],histL$counts[i],0),col=rgb(108,166,205,maxColorValue=255),border=NA)
}
abline(v=larchM, col="red",lwd=5)
text(30,30, paste("average =",round(larchM,1)),cex=1.5, col="red")

axis(1, seq(0,40,by=5),seq(0,40,by=5),cex=1.5)
axis(2, seq(0,35,by=5),seq(0,35,by=5),cex=1.5,las=2)
mtext("Tree height (m)", side=1, line=2.5, cex=1.5)
mtext("Number of observations",side=2,line=2,cex=1.5)


#just with mean and one standard deviation
plot(c(0,1),c(0,1), type="n", xlim=c(0,40), ylim=c(0,35), xaxs="i", yaxs="i",axes=FALSE,xlab=" ", ylab=" ")
for(i in 1:length(histL$breaks)){
	polygon(c(histL$breaks[i]-.25,histL$breaks[i]-.25,histL$breaks[i]+.25,histL$breaks[i]+.25),
			c(0,histL$counts[i],histL$counts[i],0),col=rgb(108,166,205,maxColorValue=255),border=NA)
}
abline(v=larchM, col="red",lwd=5)
text(30,33, paste("average =",round(larchM,1)),cex=1.5, col="red")

points(seq(larchM - larchSD, larchM + larchSD, length.out=20),
		rep(27,20), type="l",lwd=5, col=rgb(205,149,12,maxColorValue=255))
points(seq(larchM - (2*larchSD), larchM + (2*larchSD), length.out=20),
		rep(25,20), type="l",lwd=5, col=rgb(0,139,69,maxColorValue=255))		
		
text(30,28, paste("1 standard deviation =",round(larchSD,1)),cex=1.5, col=rgb(205,149,12,maxColorValue=255))
text(31,24, paste("2 standard deviation =",round(2*larchSD,1)),cex=1.5, col=rgb(0,139,69,maxColorValue=255))
axis(1, seq(0,40,by=5),seq(0,40,by=5),cex=1.5)
axis(2, seq(0,35,by=5),seq(0,35,by=5),cex=1.5,las=2)
mtext("Tree height (m)", side=1, line=2.5, cex=1.5)
mtext("Number of observations",side=2,line=2,cex=1.5)



#show with normal
plot(c(0,1),c(0,1), type="n", xlim=c(0,40), ylim=c(0,35), xaxs="i", yaxs="i",axes=FALSE,xlab=" ", ylab=" ")
for(i in 1:length(histL$breaks)){
	polygon(c(histL$breaks[i]-.25,histL$breaks[i]-.25,histL$breaks[i]+.25,histL$breaks[i]+.25),
			c(0,histL$counts[i],histL$counts[i],0),col=rgb(108,166,205,maxColorValue=255),border=NA)
}
abline(v=larchM, col="red",lwd=5)
text(30,33, paste("average =",round(larchM,1)),cex=1.5, col="red")

points(seq(larchM - larchSD, larchM + larchSD, length.out=20),
		rep(27,20), type="l",lwd=5, col=rgb(205,149,12,maxColorValue=255))
points(seq(larchM - (2*larchSD), larchM + (2*larchSD), length.out=20),
		rep(25,20), type="l",lwd=5, col=rgb(0,139,69,maxColorValue=255))	

points(seq(0,40,length.out=200),dnorm(seq(0,40,length.out=200),larchM,larchSD)*400,type="l",
		lwd=5, col=	rgb(105,89,205,maxColorValue=255))
		
text(30,28, paste("1 standard deviation =",round(larchSD,1)),cex=1.5, col=rgb(205,149,12,maxColorValue=255))
text(31,24, paste("2 standard deviation =",round(2*larchSD,1)),cex=1.5, col=rgb(0,139,69,maxColorValue=255))
legend("topleft",c("Normal distribution"), col=rgb(105,89,205,maxColorValue=255), lwd=5, bty="n", cex=1.5)
axis(1, seq(0,40,by=5),seq(0,40,by=5),cex=1.5)
axis(2, seq(0,35,by=5),seq(0,35,by=5),cex=1.5,las=2)
mtext("Tree height (m)", side=1, line=2.5, cex=1.5)
mtext("Number of observations",side=2,line=2,cex=1.5)

#comparison between species
mapleH <- rnorm(300,30,4)
mapleM <- mean(mapleH)
mapleSD <- sd(mapleH)

histM <- hist(mapleH, breaks=seq(0,45))

plot(c(0,1),c(0,1), type="n", xlim=c(0,45), ylim=c(0,35), xaxs="i", yaxs="i",axes=FALSE,xlab=" ", ylab=" ")
for(i in 1:length(histL$breaks)){
	polygon(c(histL$breaks[i]-.25,histL$breaks[i]-.25,histL$breaks[i]+.25,histL$breaks[i]+.25),
			c(0,histL$counts[i],histL$counts[i],0),col=rgb(108,166,205,155,maxColorValue=255),border=NA)
}

for(i in 1:length(histL$breaks)){
	polygon(c(histM$breaks[i]-.25,histM$breaks[i]-.25,histM$breaks[i]+.25,histM$breaks[i]+.25),
			c(0,histM$counts[i],histM$counts[i],0),col=rgb(205,79,57,155,maxColorValue=255),border=NA)
}

points(seq(0,45,length.out=200),dnorm(seq(0,45,length.out=200),larchM,larchSD)*400,type="l",
		lwd=5, col=	rgb(108,166,205,maxColorValue=255))
		
points(seq(0,45,length.out=200),dnorm(seq(0,45,length.out=200),mapleM,mapleSD)*300,type="l",
		lwd=5,	col=rgb(205,79,57,maxColorValue=255))	
		


axis(1, seq(0,45,by=5),seq(0,45,by=5),cex=1.5)
axis(2, seq(0,35,by=5),seq(0,35,by=5),cex=1.5,las=2)
mtext("Tree height (m)", side=1, line=2.5, cex=1.5)
mtext("Number of observations",side=2,line=2,cex=1.5)

points(rep(larchM, 20), seq(30.5,35,length.out=20),type="l",lwd=5, col=	rgb(108,166,205,maxColorValue=255))
points(rep(mapleM, 20), seq(30.5,35,length.out=20),type="l",lwd=5,	col=rgb(205,79,57,maxColorValue=255))


ext <- t.test(larchH, mapleH)

x.t <- seq(-25,25, by=.01)
plot(x.t, dt(x.t,ext$parameter), type="l", xlab="t statistic for difference between means", ylab="Relative density", lwd=2, col="royalblue3")
abline(v=ext$statistic,lwd=2, lty=2, col="tomato3")



#effect size
mapleH <- rnorm(10000000,27.25,2)
larchH <- rnorm(10000000,27.15,2)
t.test(larchH,mapleH)