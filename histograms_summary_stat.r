setwd("c:\\Users\\hkropp\\Google Drive\\courses\\Fall2019\\remote_sensing\\figures")

#start with sampling example and demonstrate a histogram for a few samples
heights <- c(20,21,15,17,20)

hist1 <- hist(heights, breaks=seq(14,22))

plot(c(0,1),c(0,1), type="n", xlim=c(13,22), ylim=c(0,3), xaxs="i", yaxs="i",axes=FALSE,xlab=" ", ylab=" ")
for(i in 1:length(hist1$breaks)){
	polygon(c(hist1$breaks[i]-.25,hist1$breaks[i]-.25,hist1$breaks[i]+.25,hist1$breaks[i]+.25),
			c(0,hist1$counts[i],hist1$counts[i],0),col=rgb(108,166,205,maxColorValue=255),border=NA)
}