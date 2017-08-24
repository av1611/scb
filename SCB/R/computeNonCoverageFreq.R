#' @title computeNonCoverageFreq
#'
#' @name computeNonCoverageFreq
#'
#' @aliases
#'
#' @description For each band in bandsArray it computes isCovered and ads up all those zeros and ones. Divides this sum by replicationCount = length or dim of bandsArray
#'
#' @param replicationCount a replication count.
#' @param sampleSize a sample size.
#' @param lag a lag value, true lag is lag - 1.
#' @param tParArray a T parameter array
#' @param corArray a true correlation array
#' @param kernel the Epanechnikov kernel.
#' @param bandwidth a bandwidth value.
#' @param nonCoverageProbability probability of non-coverage.
#'
#' @returns A scalar value of non-coverage frequency, zero count over replication count.
#'
#' @examples
#' computeNonCoverageFreqByCorBands(bandsArray, corArray)



computeNonCoverageFreq  <- function(replicationCount,
                                    sampleSize,
                                    lag,
                                    tParArray,
                                    corArray,
                                    kernel = normalDifferenceKernel,
                                    bandwidth = 0.5,
                                    nonCoverageProbability = 0.05) {
  lagCount = length(tParArray) - 1
  bandsBrick = createBandsBrick(sampleSize = sampleSize,
                                tParArray  = tParArray,
                                lag        = lag,
                                lagCount   = lagCount,
                                bandwidth  = bandwidth,
                                kernel     = kernel,
                                nonCoverageProbability = nonCoverageProbability,
                                replicationCount       = replicationCount)

  isCoveredArray <- computeIsCoveredArray(bandsBrick,
                                          corArray)
  zeroCount = 0
  replicationCount = dim(bandsBrick)[1]
  for (i in 1:length(isCoveredArray)) {
    if (isCoveredArray[i] == 0) {
      zeroCount <- zeroCount + 1
    }
  }

  nonCoverageFreq <- zeroCount / replicationCount

}
