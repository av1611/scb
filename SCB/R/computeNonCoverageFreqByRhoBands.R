#' @title computeNonCoverageFreqByRhoBands
#'
#' @name computeNonCoverageFreqByRhoBands
#'
#' @aliases
#'
#' @description
#'
#' @param bandsArray bandsArray.
#' @param rho rho
#'
#' @return
#'
#' @examples
#'



computeNonCoverageFreqByRhoBands  <- function(bandsArray,
                                              rho)
{
  # What it does
  # Takes a model.
  # For this model it calculates the rho
  # Creates many samples
  # For each sample it creates a band
  # Creates an array of zeros and ones (1 if a true rho is covered by a band)
  # Calculates alpha hat or
  # nonCoverageProbabilityHat = number of zeros / superReplication
  # nonCoverageProbabilityHat <-
  array1=array(0,dim=c(replicationCount,samplesize,2))

  n=length(bandsArray)
  for(index in 1:n)
  {
   # band=createBand(X = rnorm(n = 10, mean = 0, sd = 1), nonCoverageProbability = 0.05)
    myLag=2
    tParCount = 10
    mockTParArray <- createTParArray(tParCount = tParCount)
    mockNoise <- createNoise(sampleSize = tParCount,
                             mean = 0,
                             sd = 1)
    mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                                tParArray = mockTParArray)
    mockTVMA1 <- createTVMA1(sampleSize = tParCount,
                             tvMA1CoefArray = mockTVMA1CoeffArray,
                             noise = mockNoise)
    Cor=computeCor(lag=myLag,tvMa1CoefArray = mockTVMA1)
    zeroCount=0
    IsCovered=computeIsCovered(bandsArray[i],Cor)
    replicationCount=n
    for(i in 1:length(IsCovered))
    {
      if(IsCovered[i]==0)
        zeroCount=zeroCount+1
    }
    nonCoverageProbability=zeroCount/replicationCount


  }

}
