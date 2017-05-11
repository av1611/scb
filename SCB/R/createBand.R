#' Create a confidence intervals band.
#'
#' @param X a vector of \code{X}.
#' @param alpha the probability of non-covering the real values with the estimated ones. \code{alpha = 0.05} by default.
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#' @examples
#' createBand(X = rnorm(n = 10, mean = 0, sd = 1), alpha = 0.05))
#' createBand(X = rnorm(n = 20, mean = 5, sd = 10), alpha = 0.15))

createBand <- function (X,
                        alpha = 0.05
                        ) {
  lowerBound <- rep(x = 0, times = length(X))
  upperBound <- rep(x = 1, times = length(X))
  band <- rbind(lowerBound, upperBound)
}
