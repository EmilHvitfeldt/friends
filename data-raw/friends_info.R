## code to prepare `friends_wikipedia` dataset goes here

library(tidyverse)
library(rvest)
library(glue)

wikitable_raw <- read_html("https://en.wikipedia.org/wiki/List_of_Friends_episodes") %>%
  html_nodes('table[class="wikitable plainrowheaders wikiepisodetable"]') %>%
  html_table() %>%
  map2(seq_len(10),
       ~select(.x,
               episode = `No. inseason`,
               title = Title,
               directed_by = `Directed by`,
               written_by = `Written by`,
               air_date = `Original air date`,
               us_views_millions = `U.S. viewers(millions)`) %>%
         mutate(season = .y)) %>%
  bind_rows()

split_episode <- function(x) {
  x <- as.character(x)
  if (nchar(x) == 4) {
    return(paste(substr(x, 1, 2), substr(x, 3, 4)))
  }
  x
}

imdb_rating <- function(x) {
  rating <- read_html(glue("https://www.imdb.com/title/tt0108778/episodes?season={x}")) %>%
    html_nodes('div[class="list detail eplist"]
             div[class="ipl-rating-star small"]
             span[class="ipl-rating-star__rating"]') %>%
    html_text() %>%
    as.numeric()
  tibble(season = x,
         episode = seq_along(rating),
         imdb_rating = rating)
}

imdb_ratings <- map_dfr(seq_len(10), imdb_rating)

imdb_ratings <- imdb_ratings %>%
  add_row(season = 10,
          episode = 18,
          imdb_rating = tail(imdb_ratings$imdb_rating, 1))

friends_info <- wikitable_raw %>%
  mutate(episode = map_chr(episode, split_episode)) %>%
  separate_rows(episode, sep = " ", convert = TRUE) %>%
  mutate(title = str_remove(title, '"'),
         title = str_remove(title, '".*'),
         air_date = str_remove(air_date, "\\(.*"),
         air_date = as.Date(air_date, format = "%B %e, %Y"),
         us_views_millions = str_remove(us_views_millions, "\\[.*"),
         us_views_millions = as.numeric(us_views_millions)) %>%
  select(season, everything()) %>%
  left_join(imdb_ratings, by = c("season", "episode")) %>%
  mutate(across(season:episode, as.integer))

usethis::use_data(friends_info, overwrite = TRUE)
