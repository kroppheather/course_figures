##
library(sp)
library(rgdal)

NY_lat <- readOGR("w:\\Thurs_LabB\\hkropp\\data\\NY_NAD.shp")
plot(NY_lat)

plot(NY_lat@polygons[[1]]@Polygons[[1]]@coords, type="l")

NY_utm <- readOGR("w:\\Thurs_LabB\\hkropp\\data\\NY_UTM.shp")

plot(NY_utm@polygons[[1]]@Polygons[[1]]@coords, type="l")

#create data frame

NY_upstate <- data.frame(utm_x=NY_utm@polygons[[1]]@Polygons[[1]]@coords[,1],
							utm_y=NY_utm@polygons[[1]]@Polygons[[1]]@coords[,2],
							lat_x=NY_lat@polygons[[1]]@Polygons[[1]]@coords[,1],
							long_y=NY_lat@polygons[[1]]@Polygons[[1]]@coords[,2])
							
write.table(NY_upstate, "w:\\Thurs_LabB\\hkropp\\data\\NY_upstate_coord.csv",sep=",", row.names=FALSE)



plot(NY_utm, col = "grey75", border=NA)
polygon(NY_utm@polygons[[1]]@Polygons[[2]]@coords[,1],NY_utm@polygons[[1]]@Polygons[[2]]@coords[,2], col= "tomato3", border =NA)
polygon(NY_utm@polygons[[1]]@Polygons[[3]]@coords[,1],NY_utm@polygons[[1]]@Polygons[[3]]@coords[,2], col= "royalblue3", border =NA)
polygon(NY_utm@polygons[[1]]@Polygons[[4]]@coords[,1],NY_utm@polygons[[1]]@Polygons[[4]]@coords[,2], col= "darkgoldenrod3", border =NA)

legend("topleft", c("polygon shape 1","polygon shape 2","polygon shape 3","polygon shape 4"),
				fill=c("grey75","tomato3","royalblue3","darkgoldenrod3"), border=NA,
				bty="n", cex=1.5)