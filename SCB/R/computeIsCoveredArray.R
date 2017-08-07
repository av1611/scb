#' @title computeIsCoveredArray
#'
#' @name computeIsCoveredArray
#'
#' @aliases
#'
#' @description in a cycle for each band in a brick call computeIsCovered
#'
#' @param bandsBrick bandsBrick
#' @param corArray corArray
#'
#' @return Brick of vectors with values {0, 1}.
#'
#' @examples

computeIsCoveredArray <- function(bandsBrick,
                                  corArray)
{
  replicationCount = dim(bandsBrick)[1]
  isCoveredArray <- array(0, dim = replicationCount)

  for (replicationIndex in 1:replicationCount)
  {
    band <- bandsBrick[replicationIndex, ,]
    isCoveredArray[replicationIndex] <- computeIsCovered(band, corArray)
  }

  isCoveredArray
}
