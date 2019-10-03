library(rgdal)
library(gdalUtils)#probably don't need this
library(sp)
library(maps)
library(rgeos)
library(raster)
#define coordinate system
laea <- "+proj=laea +lat_0=90 +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs" 

#max missing is predominately zero throughout the entire map. Not worth showing
worldmap <- map("world", ylim=c(40,90), fill=TRUE)

#world map
world <- project(matrix(c(worldmap$x,worldmap$y), ncol=2,byrow=FALSE),laea)


###make polygon to cover up non study area####
#make a point at center of map
pt1 <- SpatialPoints(data.frame(x=0,y=0), CRS(laea))
#make a buffer around center of plot choosing distance that is relevant
ptBuff <- buffer(pt1,4500000)
#set up bounds to extend beyond study area
xcor <- c(-8000000,-8000000,8000000,8000000)
ycor <- c(-8000000,8000000,8000000,-8000000)
#make empty plot polygon
boxC <- cbind(xcor,ycor)
p <- Polygon(boxC)
ps <- Polygons(list(p),1)
sps <- SpatialPolygons(list(ps))
proj4string(sps) = CRS("+proj=laea +lat_0=90 +lon_0=0 +x_0=0 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs" )
#remove study area from empty plot
PolyBlock <- gDifference(sps,ptBuff, byid=TRUE)

#set up colors
water <- rgb(149/255,218/255,255/255,.3)
land <- rgb(250,230,190, max=255)

	par(mai=c(0,0,0,0))
	plot(c(0,1),c(0,1),type="n",axes=FALSE,xlab=" ", ylab=" ",xlim=c(-4150000,4150000),ylim=c(-4150000,4150000))
	#color background
	polygon(c(-5000000,-5000000,5000000,5000000),c(-5000000,5000000,5000000,-5000000), border=NA, col=water)
	#boundaries
	points(world, type="l", lwd=2, col="grey65")
	#continent color
	polygon(c(world[,1],rev(world[,1])), c(world[,2],rev(world[,2])),col=land,border=NA)
	#block out nonstudy area
	plot(PolyBlock, col="white",border="white", add=TRUE)
