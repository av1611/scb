#' @name createMa1
#'
#' @aliases ma1
#'
#' @description A manual implementation of MA1 algo.
#'
#' Intended to be run as an underlying function from within \code{createX}.
#' Thus, supposed to be passed as the value of \code{model} option of \code{createX} function
#'
#' @param sampleSize the sample size.
#' @param ma1CoefArray the \code{MA1 coefficents array}.
#' @param noise a white-noise vector.
#'
#' @return The vector of \code{X}
#'
#' @example

createMa1 <- function(sampleSize,
                      ma1CoefArray,
                      noise) {
  X = array(0, dim = sampleSize)
  X[1] <- noise[1]

  for (i in 2:sampleSize) {
    X[i] <- noise[i] + ma1CoefArray[i] * noise[i - 1]
  }

  X
}
