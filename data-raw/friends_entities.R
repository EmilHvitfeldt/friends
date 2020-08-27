## code to prepare `friends_entities` dataset goes here
library(tidyverse)
library(jsonlite)

extract_entities <- function(x) {
  map_chr(x[lengths(x) == 1],
          ~ .x[[1]][[3]])
}

read_utterances <- function(x) {
  res <- list(id = x$utterance_id,
              entities = list(extract_entities(x$character_entities)))
  res
}

read_scene <- function(x) {
  map_dfr(x$utterances, read_utterances)
}

read_episode <- function(x) {
  map_dfr(x$scenes, read_scene)
}

read_season <- function(x) {
  map_dfr(x$episodes, read_episode)
}

read_friends <- function() {
  season_numbers <- c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10")
  urls <- glue::glue("https://raw.githubusercontent.com/emorynlp/character-mining/master/json/friends_season_{season_numbers}.json")
  map_dfr(urls, ~ .x %>% read_json() %>% read_season())
}

friends_raw <- read_friends()

friends_entities <- friends_raw %>%
  filter(0 < lengths(entities)) %>%
  separate(id, c("season", "episode", "scene", "utterance")) %>%
  mutate(across(c("season", "episode", "scene", "utterance"), parse_number))

usethis::use_data(friends_entities, overwrite = TRUE)
