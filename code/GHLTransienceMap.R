# Mapping transience
# code Prof Malcolm Campbell; updated May 2026
# IDI analysis Dr Lukas Marek
# Reference - see https://www.sciencedirect.com/science/article/pii/S019739752300022X#abs0020
pacman::p_load(sf, tmap, tmaptools, dplyr)

#Transience <- st_read("Transience_SA2_NZ.gpkg")
Transience <- st_read(file.choose())

##########################################################################
# Sorry Chathams....
Transience <- Transience |>   filter(SA2_name!="Chatham Islands")
##########################################################################
# Map it!
Map <- 
tm_shape(Transience) + 
  tm_polygons(fill="Transience_NZ_SA2_Non.movers_perc",
              tm_scale_continuous(values = "brewer.yl_or_rd"),
              fill_alpha = 0.5,
              fill.legend = tm_legend(title = "Non-Movers, %",
              position = tm_pos_in("left", "top"),
              frame=FALSE)
              )+
  tm_title("Transience Index GHL",
           size = 2,
           color = "white",
           fontface = "bold",
           bg = TRUE,
           bg.color = "black") +
  tm_credits("Te Taiwhenua o te Hauora | GeoHealth Laboratory, \n Statistics New Zealand, IDI") + 
  # Borders
  tm_shape(Transience) +   
  tm_borders(lwd=0.1) 
#
Map 
tmap_save(tm=Map, 
          filename = "TransienceNonMover.png",
          dpi=400, units="mm",
          height=297, width=210)
# Interactive
tmap_mode ("view")
Map
tmap_mode("plot")

# Tidy up
rm(Map)
#####################################################
# Map it! - INSETS 3 cities
Map <- 
tm_shape(Transience) + 
  tm_polygons(fill="Transience_NZ_SA2_Non.movers_perc",
              tm_scale_continuous(values = "brewer.yl_or_rd"),
              col=NULL,
              fill_alpha = 0.5,
              fill.legend = tm_legend(title = "Non-Movers, %",
              reverse = FALSE,
              frame = FALSE,
              orientation = "landscape",
              position = tm_pos_out("center", "bottom", pos.h = "center"))
              ) +
  tm_credits("Te Taiwhenua o te Hauora, \nGeoHealth Laboratory, \n Statistics New Zealand, IDI") + 
  # Borders
  tm_shape(Transience) +   
  tm_borders(lwd=0.1, col="grey20") +
  #
  tm_title("Transience Index GHL",
           size = 1,
           color = "black",
           fontface = "bold",
           position = tm_pos_out("center", "top", pos.h = "center")) +
#####
# Insets
  # Auckland
  tm_title("Tāmaki Makaurau|Auckland", size = 0.8, position = c("left", "top")) +
  tm_inset(bb("Auckland"), position = c("left", "top"), 
           #height=10, width =10, 
           box_frame.color = "orange", main_frame.color = "orange") +
  # Wellington
  tm_title("Te Whanganui-a-Tara|Wellington", size = 0.8, position = c("left", "top")) +
  tm_inset(bb("Wellington"), position = c("left", "top"), 
          # height=10, width =10, 
           box_frame.color = "blue", main_frame.color = "blue") +
  # Christchurch
  tm_title("Ōtautahi|Christchurch", size = 0.8, position = c("left", "top")) +
  tm_inset(bb("Christchurch"), position = c("left", "top"), 
         #  height=10, width =10, 
           box_frame.color = "yellow", main_frame.color = "yellow") +
  #
  tm_layout(inner.margins = c(0.05, 0.2, 0.05, 0.05), 
            frame = FALSE, 
            outer.margins = 0)
# display
Map
# save the map
tmap_save(tm=Map, 
          filename = "TransienceNonMover_Inset3.png",
          dpi=400, units="mm",
          height=297, width=210)
#END
