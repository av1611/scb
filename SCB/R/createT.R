#' Create \code{t}.
#'
#' @param lengthT the desired length of \code{t} vector.
#' @return The vector of \code{t} values
#' @examples
#' createT(lengthT = 10)
#' createT(lengthT = 100)

createT <- function(sampleSize) {
  t <- seq(from = 0,
           to = 1-1/sampleSize,
           by = 1/sampleSize)
}
