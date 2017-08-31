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
                                        bandwidth,
                                        nonCoverageProbability) {
  corArray <-
    computeCor(lag = myLag,
               coefFunction = sin,
               tParArray = mockTParArray)

  alphaHatArray <- array(0, dim = mySuperReplicationCount)

  corArray <- computeCor(lag = lag,coefFunction = sin,tParArray = mockTParArray)

  for (superIndex in 1:superReplicationCount) {
    alphaHatArray[superIndex] <- computeNonCoverageFreq(replicationCount=replicationCount,
                                                        sampleSize = sampleSize,
                                                        lag = lag,
                                                        tParArray = tParArray,
                                                        corArray = corArray,
                                                        kernel = kernel,
                                                        lagCount = lagCount,
                                                        bandwidth = bandwidth,
                                                        nonCoverageProbability = nonCoverageProbability)

  }

  alphaHatArray



}

