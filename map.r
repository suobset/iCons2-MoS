library(leaflet)
library(tidyverse)
library(sf)
library(here)

set.seed(69)
randomNumbers <- sample.int(100, 138, replace = TRUE)

root1 <- here("data", "mbta_rapid_transit", "MBTA_ARC.shp") %>%
  st_read() %>%
  st_transform(4326) %>% # Weird coordinate system: dont question
  mutate(score = randomNumbers)

root2 <- here("data", "Voronoi", "Voronoi.shp") %>%
  st_read() %>%
  st_transform(4326)

# Voronoi Color palette
pal <- colorFactor(palette = c('navy', 'red'),
                   levels = levels(df$group))

# Leaflet function from leaflet package which makes a leaflet map
leaflet() %>%
  addTiles() %>%
  addPolylines(data = root1, label = root1$score) %>%
  addPolylines(data = root2, color="#FF0000", opacity=0.25)
