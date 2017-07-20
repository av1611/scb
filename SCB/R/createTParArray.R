#' @name createTParArray
#'
#' @aliases createSleeper
#'
#' @description Create \code{T parameter array}.
#'
#' @param tParCount the desired length of \code{T parameter} vector.
#'
#' @return The vector of \code{T parameter array}.
#'
#' @example
#' createTParArray(tParCount = 10)
#' createTParArray(tParCount = 100)

createTParArray <- function(tParCount) {
  tParArray <- seq(from = 0,
                   to = 1-1/tParCount,
                   by = 1/tParCount)
}
