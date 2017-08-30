#' @title computeNonCoverageFreqDist
#'
#' @name computeNonCoverageProbDist
#'
#' @aliases
#'
#' @description
#'
#' @param superReplicationCount superReplicationCount
#' @param replicationCount a replication count.
#' @param sampleSize a sample size.
#' @param lag a lag value, true lag is lag - 1.
#' @param tParArray a T parameter array
#' @param kernel the Epanechnikov kernel.
#' @param bandwidth a bandwidth value.
#' @param nonCoverageProbability probability of non-coverage.
#'
#' @return
#'
#' @examples
#'


computeNonCoverageFreqArray  <- function(superReplicationCount,
                                        replicationCount,
                                        sampleSize,
                                        lag,
                                        lagCount,
                                        tParArray,
                                        kernel = normalDifferenceKernel,
                                        bandwidth = 0.5,
                                        nonCoverageProbability = 0.05) {
  alphaHatArray <- array(0, dim = superReplicationCount)
  tvMa1CoefArray <- createTVMA1CoefArray(coefFunction = myCoefFunction,
                                         sampleSize = sampleSize)
  corArray <- computeCor(lag = lag,
                         tvMa1CoefArray = tvMa1CoefArray)

  for (superIndex in 1:superReplicationCount) {
    alphaHatArray[superIndex] <- computeNonCoverageFreq(replicationCount,
                                                        sampleSize = sampleSize,
                                                        lag = lag,
                                                        tParArray = tParArray,
                                                        corArray = corArray,
                                                        kernel = kernel,
                                                        bandwidth = bandwidth,
                                                        nonCoverageProbability = nonCoverageProbability)

  }

  alphaHatArray
}
