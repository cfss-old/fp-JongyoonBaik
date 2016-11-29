library(tidyverse)
library(ggplot2)
library(readr)
library(forcats)
library(feather)

##modify tables
litigation_china <- read_csv("data.csv") %>%
  tbl_df()
location_china <- read_csv("location.csv") %>%
  tbl_df()

###average litigation cases
litigation_average <- litigation_china %>%
  group_by(province) %>%
  summarise(
    average_litigation = mean(cases)
  )

###merging two data
litigation_location <- litigation_average %>%
  full_join(location_china, by = "province")

##create a map
library(ggmap)
library(mapproj)

china_map <-ggmap(
  get_googlemap(
    center = c(lon = 103, lat = 35.86),
    zoom = 4)
)
ggsave("results/china_map.png", china_map)

###express the data on the map
china_map +
  geom_point(data = litigation_location,
             aes(x = long, y = lat),
             alpha = .3,
             color = "red") +
  ggtitle("Average Number of Cases")

