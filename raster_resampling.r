library(raster)


setwd("e:\\resample")
#read in landsat for resampling 
land <- raster("LC08_L1TP_015030_20190812_20190820_01_T1_B3.TIF")
#drone 15 x 15 cm spatial resolution
bewkes <- stack("bewkes_ortho6_20.tif")
plotRGB(bewkes)
#clip landsat to bewkes extent
land_clip <- crop(land,bewkes)
plot(land_clip)
#resample landsat
bewkes30 <- resample(bewkes,land_clip)
#compare the two raster
par(mfrow=c(1,2))
plotRGB(bewkes)
plotRGB(bewkes30)

writeRaster(bewkes30,"bewkes_resample.tif", format="GTiff")