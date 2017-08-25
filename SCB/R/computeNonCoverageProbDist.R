#' @title computeNonCoverageProbDist
#'
#' @name computeNonCoverageProbDist
#'
#' @aliases
#'
#' @description
#'
#' @param superReplicationCount superReplicationCount
#' @param sampleSize sampleSize
#' @param replicationCount replicationCount
#' @param nonCoverageProbability nonCoverageProbability
#'
#' @return
#'
#' @examples
#'

computeNonCoverageProbDist <- function(superReplicationCount,
                                       sampleSize,
                                       replicationCount,
                                       nonCoverageProbability) {
  alphaHatArray = array(0, dim = superReplicationCount)
  myTParCount = 10
  myTParArray = createTParArray(myTParCount)
  mylag = 2
  myTVMA1Coef = createTVMA1CoefArray(coefFunction = myCoefFunction, sampleSize = sampleSize)
  CorArray = computeCor(mylag, myTVMA1Coef)
  for (superIndex in 1:superReplicationCount)
  {
    alphaHatArray[superIndex] = computeNonCoverageFreq(sampleSize = sampleSize-superIndex,
                                                       tParArray = myTParArray,
                                                       corArray = CorArray)

  }
  return(alphaHatArray)

}
