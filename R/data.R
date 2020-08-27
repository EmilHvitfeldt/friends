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
