#' @title computeNonCoverageFreq
#'
#' @name computeNonCoverageFreq
#'
#' @aliases
#'
#' @description For each band in bandsArray it computes isCovered and ads up all those zeros and ones. Divides this sum by replicationCount = length or dim of bandsArray
#'
#' @param bandsArray a 3-dimensional array of confidence bands, size c(replicationCount, sampleSize, 2).
#' @param corArray a tru correlation array
#'
#' @returns A scalar value of non-coverage frequency, zero count over replication count.
#'
#' @examples
#' computeNonCoverageFreqByCorBands(bandsArray, corArray)



computeNonCoverageFreq  <- function(sampleSize,
                                    tParArray,
                                    corArray,
                                    bandsArray)
  {
  # What it does
  # Takes a model.
  # For this model it calculates the rho
  # Creates many samples
  # For each sample it creates a band
  # Creates an array of zeros and ones (1 if a true rho is covered by a band)
  # Calculates alpha hat or
  # nonCoverageProbabilityHat = number of zeros / superReplication
  bandsArrayRepCount <- dim(bandsArray)[1]

    for(bandsArrayRepCountIndex in 1:bandsArrayRepCount)
    {

    band = bandsArray[bandsArrayRepCountIndex, , ]
    cat("\n band= ",band)
    isCoveredArray <- computeIsCoveredArray(band,
                                            corArray)
    cat("\n isCovered array:",isCoveredArray)
    for(i in 1:length(isCoveredArray))
      {
      if (isCoveredArray[i] == 0)
        {
        zeroCount <- zeroCount + 1
      }
      }

    nonCoverageProbability <- zeroCount / bandsArrayRepCount
  }
}
