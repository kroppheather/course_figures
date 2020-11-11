install.packages("remotes")

install.packages("sf")
library(sf)

remotes::install_github("r-spatial/rgee")
library(rgee)

## It is necessary just once
ee_install()

# Initialize Earth Engine!
ee_Initialize()
