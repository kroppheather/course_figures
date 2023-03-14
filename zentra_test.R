library(remotes)
library(zentracloud)

  

url <- "https://gitlab.com/meter-group-inc/pubpackages/zentracloud"

remotes::install_git(url = url)

source("/Users/hkropp/Documents/weather_token.r")

setZentracloudToken(w_token)

zentra_data <- getReadings(
  device_sn = "z6-10463",
  token = w_token,
  start_time = "2023-03-11 00:00:00",
  end_time = "2023-03-12 23:00:00",
  cache = "default",
  domain = "default",
   force = FALSE
)
str(zentra_data)
head(zentra_data[[2]])
sensorDF <- zentra_data[[2]]


# questions:
# what is timestamp utc? Is it in postix?
# better documentation for  datetime? 
# running the first UTC time column in an epoch time converter
# yields local time in the timezone and dst conversion is in there
# timezone offset in seconds. Time zone offset makes no sense for local time
# with daylight savings with a hop in the timezone at 4 am
# but the actual daylight savings shift is correct in local time

library(ggplot2)
library(lubridate)
sensorDF$timeF <- ymd_hms(sensorDF$datetime)

ggplot(sensorDF, aes(x=timeF, y=`Air Temperature`))+
  geom_point()+
  geom_line()

park_data <- getReadings(
  device_sn = "z6-18662",
  token = k_token,
  start_time = "2022-08-01 00:00:00",
  end_time = "2023-03-12 23:00:00",
  cache = "default",
  domain = "default",
  force = FALSE
)
# too many requests error after a couple of mins
# even one month was too many requests
park_data <- getReadings(
  device_sn = "z6-18662",
  token = k_token,
  start_time = "2022-08-01 00:00:00",
  end_time = "2022-08-02 23:00:00",
  cache = "default",
  domain = "default",
  force = FALSE
)

park_data2 <- getReadings(
  device_sn = "z6-18662",
  token = k_token,
  start_time = "2022-08-01 00:00:00",
  end_time = "2022-08-14 23:00:00",
  cache = "default",
  domain = "default",
  force = FALSE
)
# too many requests

park_data3 <- getReadings(
  device_sn = "z6-18662",
  token = k_token,
  start_time = "2022-08-01 00:00:00",
  end_time = "2022-08-7 23:00:00",
  cache = "default",
  domain = "default",
  force = FALSE
)
