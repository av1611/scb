#' Create \code{t}.
#'
#' @param lengthT the desired length of \code{t} vector.
#' @return The vector of \code{t} values
#' @examples
#' createT(lengthT = 10)
#' createT(lengthT = 100)

createT <- function(number_steps) {
  t <- seq(from = 0,
           to = 1-1/number_steps,
           by = 1/number_steps)
}
