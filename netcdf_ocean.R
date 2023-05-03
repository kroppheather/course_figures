library(raster)

sst <- raster("c:/Users/hkropp/Downloads/oisst-avhrr-v02r01.20140101.nc")

plot(sst[[1]])

writeRaster(sst[[1]], "c:/Users/hkropp/Downloads/sst2014-0101.tif", format="GTiff")


files <- list.files("c:/Users/hkropp/Downloads/Final_data_bad/Final_data_bad")
fileName <- gsub(".nc",".tif", files)

sstL <- list()

for(i in 1:length(files)){
  
  sstL[[i]] <- raster(paste0("c:/Users/hkropp/Downloads/Final_data_bad/Final_data_bad/", files[i]))
}

for(i in 1:length(files)){
writeRaster(sstL[[i]], paste0("c:/Users/hkropp/Downloads/Final_data_good/",fileName[i]), format="GTiff")
}