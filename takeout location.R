install.packages("rjson")
library(rjson)

library(sf)
myData <- fromJSON(file="/Users/hkropp/Downloads/Takeout/Location History/Semantic Location History/2022/2022_SEPTEMBER.json")

test <- myData[[1]]

test2 <- test[[1]]
str(myData)

str(test2)

test2$activitySegment
path <- test2$activitySegment$waypointPath$waypoints

length(path)
lat <- numeric()

long <- numeric()
for(i in 1:length(path)){
  lat[i] <- path[[i]][1]$latE7
  long[i] <- path[[i]][2]$lngE7
}
df <- data.frame(lat=lat, long=long)
df <- df/10000000

points <- st_as_sf(df, coords=c(x= "long",y= "lat"), crs = 4326)
mapview(points)
