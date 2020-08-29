library(tidyverse)
library(jsonlite)

extract_entities <- function(x) {
  map_chr(x[lengths(x) == 1],
          ~ .x[[1]][[3]])
}

read_utterances <- function(x) {
  res <- list(id = x$utterance_id,
              text = x$transcript)

  if (length(x$speakers) == 1) {
    res$speaker <- x$speakers[[1]]
  } else {
    res$speaker <- NA
  }

  if (!is.null(x$transcript_with_note)) {
    res$transcript_with_note <- x$transcript_with_note
  } else {
    res$transcript_with_note <- NA
  }

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

friends <- friends_raw %>%
  mutate(speaker = if_else(nchar(text) == 0, "Scene Directions", speaker),
         text = if_else(nchar(text) == 0, transcript_with_note, text)) %>%
  separate(id, c("season", "episode", "scene", "utterance")) %>%
  mutate(across(c("season", "episode", "scene", "utterance"), parse_number)) %>%
  mutate(across(c("season", "episode", "scene", "utterance"), as.integer)) %>%
  select(-transcript_with_note) %>%
  select(text, speaker, season, episode, scene, utterance)

usethis::use_data(friends, overwrite = TRUE)
