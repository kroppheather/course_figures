library(raster)
library(sf)
library(dplyr)
library(tidycensus)



source("c:/Users/hkropp/Documents/census_key.r")
census_api_key(key)


##### Oneida county #####

#total population, 2 white alone, 3, black alone , 4= native american alone, 5 = asian alone, 8 = two or more races
race <- get_acs("tract", state="36", county="065",
                variables = c("B02001_001","B02001_002", "B02001_003", "B02001_004", "B02001_005", "B02001_008"),
                year=2020, geometry=TRUE, output="wide")
#
# median household income in dollars
income_house <- get_acs("tract", state="36", county="065",
                        variables = c("B19013_001"),year=2020, geometry=TRUE)
plot(income_house["estimate"])






# column 1 is total people, 3 is male under 5 years and 27 is female under 5 years old
age <- get_acs("tract", state="36", county="065",
               variables = c("B01001_001","B01001_003","B01001_027"), year=2020, geometry=TRUE, output="wide")



# vulnerable ages (kids under 5)

age$kid_total <- ((age$B01001_003E + age$B01001_027E)/ age$B01001_001E)*100
plot(age["kid_total"])

child <- data.frame(FID = seq(1,nrow(age)),
                    GEOID = age$GEOID,
                    chld_five = age$kid_total,
                    geometry=age$geometry)

child_oneida <- st_as_sf(child)

### organize income data
incomeSubset <- data.frame(FID = seq(1,nrow(income_house)),
                           GEOID = income_house$GEOID,
                           hh_income = income_house$estimate,
                           margin_err = income_house$moe,
                           geometry= income_house$geometry)
income_oneida <- st_as_sf(incomeSubset)


### organize race data

# organize for students to use on ArcGIS online. Convert to proportions for choropleth

raceSubset <- race[,c("B02001_001E","B02001_002E","B02001_003E", "B02001_004E", "B02001_005E", "B02001_008E")]

raceSubset$white_pct  <- ifelse(raceSubset$B02001_001E == 0, 0,
                                    (raceSubset$B02001_002E/raceSubset$B02001_001E)*100)
plot(raceSubset["percent_white"])

raceSubset$black_pct  <- ifelse(raceSubset$B02001_001E == 0, 0,
                                    (raceSubset$B02001_003E/raceSubset$B02001_001E)*100)
plot(raceSubset["percent_black"])

raceSubset$ntv_am_pct  <- ifelse(raceSubset$B02001_001E == 0, 0,
                                    (raceSubset$B02001_004E/raceSubset$B02001_001E)*100)

plot(raceSubset["percent_native_american"])

raceSubset$asn_pct  <- ifelse(raceSubset$B02001_001E == 0, 0,
                                              (raceSubset$B02001_005E/raceSubset$B02001_001E)*100)

plot(raceSubset["percent_asian"])

raceSubset$multi_pct  <- ifelse(raceSubset$B02001_001E == 0, 0,
                                    (raceSubset$B02001_008E/raceSubset$B02001_001E)*100)

plot(raceSubset["percent_biracial"])


# prepare for ArcGIS

race_oneida <- data.frame(FID = seq(1, nrow(raceSubset)),
                          GEOID = race$GEOID,
                          raceSubset[,8:12],
                          geometry = raceSubset$geometry)

race_oneida <- st_as_sf(race_oneida)


st_write(race_oneida, "E:/Google Drive/GIS/census/oneida/acs_2020_fiveyear/race_oneida_acs.shp")

st_write(income_oneida, "E:/Google Drive/GIS/census/oneida/acs_2020_fiveyear/income_oneida_acs.shp")

st_write(child_oneida, "E:/Google Drive/GIS/census/oneida/acs_2020_fiveyear/children_oneida_acs.shp")

library(raster)
noise <- raster("E:/Google Drive/GIS/dot_2018_noise/CONUS_rail_road_and_aviation_noise_2018/CONUS_rail_road_and_aviation_noise_2018/State_rasters/NY_rail_road_and_aviation_noise_2018.tif")
plot(noise)
st_crs(race_oneida)
noise@crs
noiseP <- projectRaster(noise, crs="+init=epsg:4269")
noiseCrop <- crop(noiseP, race_oneida)

plot(noiseCrop)
plot(income_oneida$geometry, add=TRUE)


writeRaster(noiseCrop,"E:/Google Drive/GIS_teaching/ENVST110_F22/noise_2018.tif",
            format="GTiff")


library(mapview)

noiseCrop <- raster("E:/Google Drive/GIS_teaching/ENVST110_F22/noise_2018.tif")
redline <- st_read("E:/Google Drive/GIS_teaching/ENVST110_F22/NYUtica1936/cartodb-query.shp")
map50 <- raster("E:/Google Drive/GIS_teaching/ENVST110_F22/A550500171317_ref.tif")
tempAnom <- raster("E:/Google Drive/GIS_teaching/ENVST110_F22/temp_anom_c.tif")

Ucenter2 <- extent(-8382000,-8373500,
                   5324000,5329000)
map50c <- crop(map50, Ucenter2)
plot(map50c, col=gray(1:100/100))

mapview(noiseCrop, layer.name = "noise (dB)")+
  mapview(tempAnom, col=hcl.colors(12,"Zissou1") )+
  mapview(map50c, col=grey(1:100/100), maxpixels=5000000, alpha=1)+
  mapview(redline, zcol="holc_grade")#, col.regions=c("palegreen4",
                                              # "royalblue3",
                                             #  "darkgoldenrod2",
                                              # "tomato3"))

A_grade <- redline[redline$holc_grade == "A",]
B_grade <- redline[redline$holc_grade == "B",]
C_grade <- redline[redline$holc_grade == "C",]
D_grade <- redline[redline$holc_grade == "D",]

mapview(noiseCrop, layer.name = "noise (dB)")+
  mapview(tempAnom, col=hcl.colors(12,"Zissou1") )+
  mapview(map50c, col=grey(1:100/100), maxpixels=5000000, alpha=1)+
  mapview(redline)
  
mapview(noiseCrop, layer.name = "noise (dB)")+
  mapview(redline)
noiseCrop@crs
tempAnom@crs
