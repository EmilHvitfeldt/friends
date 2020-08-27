#' The transcript of Friends
#'
#' Each season consists of episodes, each episode is divided into scenes,
#' each scene comprises utterances. One utterance per row.
#' Emotion annotation is included when available.
#'
#' @source \url{https://github.com/emorynlp/character-mining}
#'
#' @format A [tibble][tibble::tibble-package] with 67,373 rows and 5 variables:
#' \code{text}, \code{speaker}, \code{season}, \code{episode},
#' \code{scene} and \code{utterance}.
"friends"

#' Character Entities for transcript of Friends
#'
#' This [tibble][tibble::tibble-package] contains the character entities for the
#' utterances where it is available.
#'
#' @source \url{https://github.com/emorynlp/character-mining}
#'
#' @format A [tibble][tibble::tibble-package] with 10,557 rows and 5 variables:
#' \code{season}, \code{episode}, \code{scene}, \code{utterance} and
#' \code{entities}.
"friends_entities"

#' Emotions for transcript of Friends
#'
#' This [tibble][tibble::tibble-package] contains the emotions for the
#' utterances where it is available.
#'
#' @source \url{https://github.com/emorynlp/character-mining}
#' @source \url{https://github.com/emorynlp/emotion-detection}
#'
#' @format A [tibble][tibble::tibble-package] with 12,606 rows and 5 variables:
#' \code{season}, \code{episode}, \code{scene}, \code{utterance} and
#' \code{entities}.
"friends_emotions"

#' Episode Information
#'
#' This [tibble][tibble::tibble-package] contains additional information about
#' each of the episodes. Information was sourced from Wikipedia and IMDb on
#' August 26th, 2020.
#'
#' @source \url{https://en.wikipedia.org/wiki/Friends}
#' @source \url{https://www.imdb.com/title/tt0108778/}
#'
#' @format A [tibble][tibble::tibble-package] with 236 rows and 8 variables:
#' \code{season}, \code{episode}, \code{title}, \code{directed_by},
#' \code{written_by}, \code{air_date}, \code{us_views_millions} and
#' \code{imdb_rating}.
"friends_info"



