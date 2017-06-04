#' Create \code{sleeper}.
#'
#' @param number_steps the desired length of \code{sleeper} vector.
#' @return The vector of \code{sleeper} values
#' @examples
#' createT(lengthT = 10)
#' createT(lengthT = 100)

createSleeper <- function(number_steps) {
  number_steps <- seq(from = 0,
           to = 1-1/number_steps,
           by = 1/number_steps)
}
