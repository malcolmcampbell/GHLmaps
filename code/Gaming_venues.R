# Professor Malcolm Campbell
# Attribution-Non Commercial-ShareAlike  # CC BY-NC-SA 
# Copyright Malcolm Campbell, August 2026
# Construction by Dr Lukas Marek  - see
# reference: http://doi.org/10.1186/s12942-021-00269-x
# source: https://www.canterbury.ac.nz/research/about-uc-research/research-groups-and-centres/te-taiwhenua-o-te-hauora-geohealth-laboratory/publications--reports-and-data
pacman::p_load(sf, tmap, tidyverse) 

# Data on the location of gaming venues (n=1081) were obtained from the 2018 Department of Internal Affairs 
# register and were extracted based on proprietary classification in the register for all licenced gaming venues. 
# Constructs were defined as consistent with the Department of Internal Affairs register and included licensed 
# venues operating gaming machines.
# Data were geocoded using Google Maps Geocoding API through Rstudio using the ggmap package with one record not 
# being able to geocode. As in with previous data, we have tested 100 randomly selected record in order to estimate 
# geocoding accuracy (98%).

#######################################################
# Mapping gaming venues

# VERSION TO DOWNLOAD AND UNZIP BEFORE READING THE FILE
temp <- tempfile()
download.file("https://www.canterbury.ac.nz/content/dam/uoc-main-site/documents/zip-files/geohealth-laboratory/Gaming_venues.zip",
              temp)

list = unzip(temp, list = TRUE)
list
#               Name Length                Date
#1 Gaming_venues.dbf 700162 2020-03-12 19:04:00
#2 Gaming_venues.prj    404 2020-03-12 19:04:00
#3 Gaming_venues.shp  30340 2020-03-12 19:04:00
#4 Gaming_venues.shx   8740 2020-03-12 19:04:00
Gaming <- st_read("Gaming_venues.shp")

tm_shape(Gaming) + 
  tm_dots()
# end
