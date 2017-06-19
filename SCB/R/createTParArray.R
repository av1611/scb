#' Create \code{T parameter array}.
#'
#' @aliases createSleeper
#' @param number_steps the desired length of \code{T parameter} vector.
#' @return The vector of \code{sleeper} values
#' @examples
#' createSleeper(number_steps = 10)
#' createSleeper(number_steps = 100)

createTParArray <- function(number_steps) {
  number_steps <- seq(from = 0,
           to = 1-1/number_steps,
           by = 1/number_steps)
}
