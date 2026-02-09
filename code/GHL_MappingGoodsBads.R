# Professor Malcolm Campbell
# Attribution-Non Commercial-ShareAlike  # CC BY-NC-SA 
# Copyright Malcolm Campbell, December 2025
# Construction by Dr Lukas Marek  - see
# reference: http://doi.org/10.1186/s12942-021-00269-x
# source: https://www.canterbury.ac.nz/research/about-uc-research/research-groups-and-centres/te-taiwhenua-o-te-hauora-geohealth-laboratory/publications--reports-and-data
pacman::p_load(sf, tmap, tidyverse) 

#mapping goods and bads

# VERSION TO DOWNLOAD AND UNZIP BEFORE READING THE FILE
# temp <- tempfile()
# download.file("https://www.canterbury.ac.nz/content/dam/uoc-main-site/documents/zip-files/geohealth-laboratory/Environmental_goods_bads_MB2018.zip", temp)
# GB <-st_read(unz(temp))

setwd("./goods_bads/Environmental_goods_bads_MB2018/")

GB <- st_read("MB2018_exposures_GB.gpkg")

tm_shape(GB) + 
  tm_polygons(fill="Goods_dec", fill.scale = tm_scale_intervals(n=10, values = "-scico.roma"),
              col=NULL)

tm_shape(GB) + 
  tm_polygons(fill="Bads_dec", fill.scale = tm_scale_intervals(n=10, values = "-scico.roma"),
              col=NULL)

# end
