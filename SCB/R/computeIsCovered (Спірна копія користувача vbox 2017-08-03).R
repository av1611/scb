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
#' band=createBand(X = rnorm(n = 10, mean = 0, sd = 1), alpha = 0.05)
#' myLag=2
#' tParCount = 10
#' mockTParArray <- createTParArray(tParCount = tParCount)
#' mockNoise <- createNoise(sampleSize = tParCount,mean = 0,sd = 1)
#' mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,tParArray = mockTParArray)
#' mockTVMA1 <- createTVMA1(sampleSize = tParCount,tvMA1CoefArray = mockTVMA1CoeffArray,noise = mockNoise)
#' Cor=computeCor(lag=myLag,tvMa1CoefArray = mockTVMA1)
#'IsCovered=computeIsCovered(band,Cor)


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

