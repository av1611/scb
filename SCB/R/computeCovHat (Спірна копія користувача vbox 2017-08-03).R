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
#'tParArray <- createTParArray(tParCount = tParCount)
#'createSample(model = createMa1,tvMA1CoefArray = seq(from = 0,to = 1,length.out = 10),noise = rnorm(n = 10,mean = 0,sd = 1)))
#'kernel=normalDiferencekernel
#'lag=2
#'bandwith=1
#'CovHat=computeCovHat(tParArray=tParArray,lag=lag,sample=sample,kernel=kernel,bandwidth=1)


computeCovHat <- function(tParArray,
                          lag,
                          sample,
                          kernel,
                          bandwidth = 1) {

  sampleSize <- length(sample)
  summation <- 0
  for (i in 1  : sampleSize) {
    for (j in seq_len(sampleSize - lag)) {
      sumTmp <- sample[j] * sample[j + lag] * kernel((j/sampleSize) - tParArray) / bandwidth
    }

    summation <- summation + sumTmp
  }

  covHat <- summation / (sampleSize * bandwidth)
}
