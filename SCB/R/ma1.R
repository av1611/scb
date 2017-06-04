#' A manual implementation of MA1 algo.
#'
#' Intended to be run as an underlying function from within \code{createX}.
#' Thus, supposed to be passed as the value of \code{model} option of \code{createX} function
#'
#' @param sampleSize the sample size.
#' @param psi the \code{psi} value.
#' @param Z a white-noise vector.
#' @return The vector of \code{X}
#' @examples
#'
#'



ma1 <- function(sampleSize,
                psi,
                Z
                ) {
  X = array(0, dim = c(sampleSize, 1))
  X[1] <- Z[1]

  for (i in 2:sampleSize) {
    X[i] <- Z[i] + psi[i] * Z[i - 1]
  }

  X
}
