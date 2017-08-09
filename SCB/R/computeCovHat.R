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
#' tParCount = 10
#' tParArray <- createTParArray(tParCount = tParCount)
#' noise <- createNoise(sampleSize = tParCount, mean = 0, sd = 1)
#' tvMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, tParArray = tParArray)
#' sample <- createSample(model = createMa1, tvMA1CoefArray = tvMA1CoefArray, noise = noise)
#' kernel  <- normalDiferencekernel
#' bandwith <- 1
#' lag <- 2
#' covHat <- computeCovHat(tParArray = tParArray, lag = lag, sample = sample, kernel = kernel, bandwidth = bandwidth)


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
