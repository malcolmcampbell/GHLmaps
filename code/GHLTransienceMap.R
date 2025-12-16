# Mapping transience
# code Prof Malcolm Campbell; updated Dec 2025
# IDI analysis Dr Lukas Marek
# Reference - see https://www.sciencedirect.com/science/article/pii/S019739752300022X#abs0020
pacman::p_load(sf, tmap)

Transience <-
st_read("Transience_SA2_NZ.gpkg")


tm_shape(Transience) + 
  tm_polygons(fill="Transience_NZ_SA2_Vulnerable.transient_perc", 
              fill.scale = tm_scale_intervals(
                style = "equal",      # a method to specify the classes
                n = 10,                 # number of classes
                values = "pu_gn_div"))#,   # color palette; 
               # col=NULL) # no borders

#END