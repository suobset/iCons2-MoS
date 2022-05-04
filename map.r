library(leaflet)
library(tidyverse)
library(sf)
library(here)
#library(censusviz)

set.seed(69)
randomNumbers <- sample.int(100, 138, replace = TRUE)

root1 <- here("data", "mbta_rapid_transit", "MBTA_ARC.shp") %>%
  st_read() %>%
  st_transform(4326) %>% # Weird coordinate system: dont question
  mutate(score = randomNumbers)

root2 <- here("data", "Voronoi", "Voronoi.shp") %>%
  st_read() %>%
  st_transform(4326)

root3 <- here("data", "Voronoi", "VoronoiDataCSV.csv") %>%
  read.csv()

# This is janky, fix later, it connects root2 blobArea data with root3 CSV file
# CSV derived from Excel, thanks Gabby and Jack
theUnionOfMyDreams <- root2 %>%
  left_join(root3, by = "STATION")

# Voronoi Color palette
pal <- colorFactor(palette = c('navy', 'red'),
                   levels = levels(df$group))

# Leaflet function from leaflet package which makes a leaflet map
leaflet() %>%
  addTiles() %>%
  addPolylines(data = root1, label = root1$score) %>%
  addPolygons(data = root2, color="#FF0000", opacity=0.25, fillOpacity = 0, label = root3$BlobScore) #%>%
  #add_people(2018, boston_sample)

