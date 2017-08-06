#' @title createBandsArray

#' @name createBandsArray
#'
#' @aliases createBands
#'
#' @description Create a three-dimensional array of confidence intervals bands of size c(replicationCount, 2, sampleSize).
#'

#' @param coverageProbability the probability of non-covering the real values with the estimated ones. \code{alpha = 0.05} by default.
#'
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#'
#' @examples
#' createBandsBrick(replicationCount = 10, sample, corArray, bandwidth = 1, nonCoverageProbability = 0.5))

createBandsBrick <- function(replicationCount,
                             sampleSize,
                             tParArray,
                             bandwidth = 1,
                             nonCoverageProbability = 0.05)
{
  # generate replicationCount of samples
  # for each sample, create a band
  # pack those bands together into a brick
  # return that brick
  myLag=2
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockNoise <- createNoise(sampleSize = myTParCount,
                           mean = 0,
                           sd = 1)
  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array,
                             noise = mockNoise)
  sampleSize = length(mockSample)

  bandsArray <- array(0, dim = c(replicationCount, sampleSize, 2))

  for(repCountIndex in 1:replicationCount)
  {
    bandsArray[repCountIndex, ,  ] <- createBand(lag=myLag,sample = mockSample,
                                                  bandwidth=1,
                                                  nonCoverageProbability=0.05)
    bandsArray
    }
}
