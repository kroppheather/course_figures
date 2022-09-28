library(raster)
library(sf)
library(dplyr)
library(tidycensus)



source("c:/Users/hkropp/Documents/census_key.r")
census_api_key(key)

#total population, 2 white alone, 3, black alone , 4= native american alone, 5 = asian alone, 8 = two or more races
race <- get_acs("tract", state="36", county="065",
                variables = c("B02001_001","B02001_002", "B02001_003", "B02001_004", "B02001_005", "B02001_008"),
                year=2020, geometry=TRUE, output="wide")
#
# median household income in dollars
income_house <- get_acs("tract", state="36", county="065",
                        variables = c("B19013_001"),year=2020, geometry=TRUE)
plot(income_house["estimate"])
income_housep <- st_transform(income_house,32618 )


# vulnerable ages

# column 1 is total people, 3 is male under 5 years and 27 is female under 5 years old
age <- get_acs("tract", state="36", county="065",
               variables = c("B01001_001","B01001_002","B01001_027"), year=2020, geometry=TRUE, output="wide")


# poverty

poverty <- get_acs("tract", state="36", county="065",
                   variables = c("S1701_001"), year=2020, geometry=TRUE, output="wide",survey="acs1")
