#' A manual implementation of MA1 algo.
#'
#' Intended to be run as an underlying function from within \code{createX}.
#' Thus, supposed to be passed as the value of \code{model} option of \code{createX} function
#'
#' @param sampleSize the sample size.
#' @param psi the \code{psi} value.
#' @param Z a white-noise vector.
#' @return The vector of \code{X}
#' @example
#'
#'



ma1 <- function(sampleSize,
                psi,
                noise) {
  X = array(0, dim = sampleSize)
  X[1] <- noise[1]

  for (i in 2:sampleSize) {
    X[i] <- noise[i] + psi[i] * noise[i - 1]
  }

  X
}
