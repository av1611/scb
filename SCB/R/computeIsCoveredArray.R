#' @title computeIsCoveredArray
#'
#' @name computeIsCoveredArray
#'
#' @aliases
#'
#' @description
#'
#' @param band band
#' @param rho rho
#'
#' @return Vector of {0, 1 values}.
#'
#' @examples


# in a cycle for each band in a brick call computeIsCovered

computeIsCoveredArray <- function(bandsBrick,
                             corArray)
{

  replicationCount = dim (bandsBrick) [1] # or 2 or 3
  isCoveredArrayByBand <- array (0, dim = replicationCount)
  for (replicationIndex in 1 : replicationCount)
  {
    band = isCoveredArrayByBand [replicationIndex, , ]
    isCovered = computeIsCovered (band, corArray)
  }


  return (isCoveredArrayByBand)
}

