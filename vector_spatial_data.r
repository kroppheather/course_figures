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