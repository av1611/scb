#' @title computeIsCovered
#'
#' @name computeIsCovered
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
#'


computeIsCovered <- function(band,
                             trueCor)
{
  # Array rho_h(i),
  # counter i corresponds to t_i = 0, 1/n, …., 1 - 1/n,
  # horizontal ACF of a sleepers process

  tParCount = length (trueCor)
  isCoveredArray = array (0,dim = tParCount)
  for (tParIndex in 1 : tParCount)
  {
    upper = band [2, ]
    lower = band [1, ]
    isUnder = (trueCor [tParIndex ] <= upper  [tParIndex ] )
    isAbove = (trueCor [tParIndex ] >= lower [tParIndex ] )
    isBetween = isUnder  & isAbove
    isCoveredArray[tParIndex ] = isBetween
  }
isCoveredArray
}

