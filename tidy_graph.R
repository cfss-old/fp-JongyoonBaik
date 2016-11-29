library(tidyverse)
library(ggplot2)
library(readr)
library(forcats)
library(feather)


litigation_china <- read_csv("data.csv") %>%
  tbl_df()

##create a map
library(ggmap)
library(mapproj)

china_map <-ggmap(
  get_googlemap(
    center = c(lon = 103, lat = 35.86),
    zoom = 4)
)
ggsave("results/china_map.png", china_map)
