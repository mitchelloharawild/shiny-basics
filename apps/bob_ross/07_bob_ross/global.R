library(dplyr)
library(tidyr)
library(readr)
library(echarts4r)
library(forcats)
library(stringr)

# Tidy the data
elements <- read_csv("data/elements-by-episode.csv") %>% 
  separate(EPISODE, c("season", "episode"), sep = c(3,6)) %>% 
  gather("element", "exists", -season, -episode, -TITLE) %>% 
  mutate(
    season = parse_number(season),
    episode = parse_number(episode),
    element = str_to_sentence(str_replace_all(element, "_", " ")),
    TITLE = str_to_sentence(TITLE),
    exists = as.logical(exists)
  ) %>% 
  rename(title = TITLE)
