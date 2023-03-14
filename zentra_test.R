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
# is datetime in utc?
# timezone offset in seconds. Time zone offeset makes no sense for local time
# with daylight savings
# regardless of the timestamp being stored in local time or UTC
# PLEASE remove spaces in column names!!!!!! 
library(ggplot2)
library(lubridate)
sensorDF$timeF <- ymd_hms(sensorDF$datetime)

ggplot(sensorDF, aes(x=timeF, y=`Air Temperature`))+
  geom_point()+
  geom_line()


