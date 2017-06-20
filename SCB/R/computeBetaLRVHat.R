#' @name computeBetaLRVHat
#'
#' @aliases computeGammaHat
#'
#' @description Computing a \code{Beta LRV Hat} given certain \code{lag}.
#'
#' @param tParArray a T parameter array, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param lag a lag value.
#' @param sample a sample.
#' @param kernel a kernel function.
#' @param bandwidth by default, bandwidth = 1.
#'
#' @return A scalar value of a \code{Beta LRV Hat} given certain \code{lag}.
#'
#' @examples
#'

computeBetaLRVHat  <- function(tParArray,
                            lag,
                            sample,
                            kernel,
                            bandwidth, ...) {
  sampleSize <- length(sample)
  summation <- 0
  for (i in 1  : sampleSize) {
    summation <- 0
    for (j in seq_len(sampleSize - lag)) {
      sumTmp <- sample[j] * sample[j + lag] * kernel((j/sampleSize) - tParArray) / bandwidth
    }

    summation <- summation + sumTmp
  }

  betaLRVHat <- summation / (sampleSize * bandwidth)
}
