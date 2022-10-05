install.packages(c("raster","sf","mapview"))
library(raster)
library(sf)
library(mapview)

noiseCrop <- raster("/Volumes/GoogleDrive/My Drive/GIS_teaching/ENVST110_F22/noise_2018.tif")
noiseCrop@crs <- CRS("+init=epsg:4269")

redline <- st_read("/Volumes/GoogleDrive/My Drive/GIS_teaching/ENVST110_F22/NYUtica1936/cartodb-query.shp")
map50 <- raster("/Volumes/GoogleDrive/My Drive/GIS_teaching/ENVST110_F22/images50.tif")
tempAnom <- raster("/Volumes/GoogleDrive/My Drive/GIS_teaching/ENVST110_F22/temp_anom_c.tif")
tempAnom@crs <- CRS("+init=epsg:26918")
map50@crs <- CRS("+init=epsg:4326")

mapview(map50, col=grey(1:100/100))+
  mapview(redline)

mapview(noiseCrop, layer.name = "noise (dB)")+
  mapview(tempAnom, col=hcl.colors(12,"Zissou1"),
          layer.name-"tempAnom (C)")+
  mapview(map50, col=grey(1:100/100), 
          maxpixels=5000000, alpha=1, legend=FALSE)+
  mapview(redline, zcol="holc_grade",
          col.regions=c("palegreen4", "royalblue3","darkgoldenrod2","tomato3"), layer.name="redlining grade")





