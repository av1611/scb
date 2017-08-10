#' @title computeCovHat
#'
#' @name computeCovHat
#'
#' @aliases
#'
#' @description
#'
#' @param tParArray a T parameter, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param lag a lag value.
#' @param sample a sample.
#' @param kernel a kernel function.
#' @param bandwidth by default, bandwidth = 1.
#'
#' @return
#'
#' @examples
#' tParArray <- createTParArray(tParCount = tParCount)
#' sample <- createSample(model = createMa1, tvMA1CoefArray = tvMA1CoefArray, noise = noise)
#' kernel  <- normalDiferencekernel
#' bandwith <- 1
#' lag <- 2


computeCovHat <- function(tParArray,
                          lag,
                          sample,
                          kernel,
                          bandwidth = 1) {

  sampleSize <- length(sample)
  summation <- 0
  for (i in 1  : sampleSize) {
    for (j in seq_len(sampleSize - lag)) {
      sumTmp <- sample[j] *
                sample[j + lag] *
                kernel((j/sampleSize) - tParArray) / bandwidth
    }

    summation <- summation + sumTmp
  }

  covHat <- summation / (sampleSize * bandwidth)
}
