library(lubridate)
library(sp)
library(rgdal)
library(maps)

#area mi2
stats <- read.csv("e:\\GIS\\drought\\dm_export_20120101_20121231N.csv")

catN <- c("Abnormally Dry", "Moderate Drought","Severe Drought","Extreme Drought","Exceptional Drought")

colN <- c(rgb(255,255,178,maxColorValue =255),
			rgb(254,217,118,maxColorValue =255),#0
			rgb(254,178,76,maxColorValue =255),#1
			rgb(253,141,60,maxColorValue =255),#2
			rgb(240,59,32,maxColorValue =255),#3
			rgb(189,0,38,maxColorValue =255))#4
			
colN2 <- c(rgb(255,255,178,80,maxColorValue =255),
			rgb(254,217,118,80,maxColorValue =255),#0
			rgb(254,178,76,80,maxColorValue =255),#1
			rgb(253,141,60,80,maxColorValue =255),#2
			rgb(240,59,32,80,maxColorValue =255),#3
			rgb(189,0,38,80,maxColorValue =255))#4			

stats$startD <- yday(as.Date(stats$ValidStart, "%m/%d/%Y"))
stats$endD <- yday(as.Date(stats$ValidEnd,  "%m/%d/%Y"))
stats$mid <- stats$startD + ((stats$endD-stats$startD)/2)

stats <- stats[1:dim(stats)[1]-1,]

stats <- stats[order(stats$mid),]
range(stats[,4])

stats1 <- stats[1:31,]
stats2 <- stats[31:33,]
stats3 <- stats[33:52,]
stats[1:32,]

windowsFont("Lucida")
par(mai=c(2,2,2,2))			
plot(c(0,1),c(0,1)	, ylim	=c(0,3100000), xlim=c(0,365),type="n", xlab= " ", ylab=" ", yaxs="i",xaxs="i",axes=FALSE)	

polygon(c(stats1$mid, rev(stats1$mid)),
		c(stats1$D0,rep(0,length(stats1$D0))), col=colN2[2], border=NA)
polygon(c(stats1$mid, rev(stats1$mid)),
		c(stats1$D1,rep(0,length(stats1$D1))), col=colN2[3], border=NA)		
polygon(c(stats1$mid, rev(stats1$mid)),
		c(stats1$D2,rep(0,length(stats1$D2))), col=colN2[4], border=NA)
polygon(c(stats1$mid, rev(stats1$mid)),
		c(stats1$D3,rep(0,length(stats1$D3))), col=colN2[5], border=NA)		
polygon(c(stats1$mid, rev(stats1$mid)),
		c(stats1$D4,rep(0,length(stats1$D4))), col=colN2[6], border=NA)		
		
		
polygon(c(stats2$mid, rev(stats2$mid)),
		c(stats2$D0,rep(0,length(stats2$D0))), col=colN[2], border=NA)
polygon(c(stats2$mid, rev(stats2$mid)),
		c(stats2$D1,rep(0,length(stats2$D1))), col=colN[3], border=NA)		
polygon(c(stats2$mid, rev(stats2$mid)),
		c(stats2$D2,rep(0,length(stats2$D2))), col=colN[4], border=NA)
polygon(c(stats2$mid, rev(stats2$mid)),
		c(stats2$D3,rep(0,length(stats2$D3))), col=colN[5], border=NA)		
polygon(c(stats2$mid, rev(stats2$mid)),
		c(stats2$D4,rep(0,length(stats2$D4))), col=colN[6], border=NA)		


polygon(c(stats3$mid, rev(stats3$mid)),
		c(stats3$D0,rep(0,length(stats3$D0))), col=colN2[2], border=NA)
polygon(c(stats3$mid, rev(stats3$mid)),
		c(stats3$D1,rep(0,length(stats3$D1))), col=colN2[3], border=NA)		
polygon(c(stats3$mid, rev(stats3$mid)),
		c(stats3$D2,rep(0,length(stats3$D2))), col=colN2[4], border=NA)
polygon(c(stats3$mid, rev(stats3$mid)),
		c(stats3$D3,rep(0,length(stats3$D3))), col=colN2[5], border=NA)		
polygon(c(stats3$mid, rev(stats3$mid)),
		c(stats3$D4,rep(0,length(stats3$D4))), col=colN2[6], border=NA)			

axis(1,c(-1,32,91,152,213,274, 335,380), c(" ","Feb","Apr","Jun","Aug","Oct", "Dec", " "), cex.axis=2, col="grey50", col.axis="grey50"	)	
axis(2, c(0, 1000000, 2000000, 3000000), c(0,1,2,3), las=2, cex.axis=2, col="grey50", col.axis="grey50"	)
mtext(expression(paste("Area of drought (millions mi "^" 2",")")), side=2, line=3, cex=2, col="grey50",)
legend(0,3200000,paste(catN),fill=colN[2:6],bty="n", border=NA, cex=2)

#max missing is predominately zero throughout the entire map. Not worth showing
worldmap <- map("world", ylim=c(30,50), fill=TRUE)

dr <- readOGR("e:\\GIS\\drought\\USDM_20120821_M\\USDM_20120821.shp")

plot(dr[dr@data$DM==1], col="red")

plot(dr[dr@data$DM==2], col="orange", add=TRUE)