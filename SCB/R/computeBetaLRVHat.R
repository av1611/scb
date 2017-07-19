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
                               bandwidth,
                               allCorHats, ...) {
  tParCount = length(tParArray)
  sampleSize = length(sample)
  termCount = 2 * sampleSize ^ (4/15) # aka L

  # check sizes
  if (lag >= sampleSize - 1 - termCount) {
    cat ("\n after if with stop \n")
    stop("wrong relation between sampleSize, termCount, lag!")
  }

  # if (! lag > termCount) {
  #   cat ("\n after if with stop \n")
  #   stop("wrong relation between sampleSize, termCount, lag!")
  # }

  betaLRVHat = array(0, dim = tParCount)
  # array of size tParCount

  for (tParIndex in 1 : tParCount) {
    for (termIndex in 1 : (termCount - lag)) {
     term = (2 * allCorHats[tParIndex, lag] * allCorHats[tParIndex, termIndex] -
        allCorHats[tParIndex, abs(lag - termIndex)] -
        allCorHats[tParIndex, lag + termIndex]) ^ 2

      betaLRVHat[tParIndex] = betaLRVHat[tParIndex] + term
    }
  }

  betaLRVHat
}
