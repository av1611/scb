#' @title createBandsArray

#' @name createBandsArray
#'
#' @aliases createBands
#'
#' @description Create a three-dimensional array of confidence intervals bands of size c(replicationCount, 2, sampleSize).
#'
#' @param sample a vector of \code{sample}.
#' @param coverageProbability the probability of non-covering the real values with the estimated ones. \code{alpha = 0.05} by default.
#'
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#'
#' @examples
#' createBandsArray(replicationCount = 10, sample, corArray, bandwidth = 1, nonCoverageProbability = 0.5))

createBandsArray <- function(replicationCount,
                             sampleSize,
                             tParArray,
                             bandwidth = 1,
                             nonCoverageProbability = 0.05)
{
  # generate replicationCount of samples
  # for each sample, create a band
  # pack those bands together into a brick
  # return that brick
  sampleSize = size(sample)

  bandsArray <- array(0, dim = c(replicationCount, sampleSize, 2))

  for(repCountIndex in 1:replicationCount)
  {
    bandsArray[repCountIndex, , , ] <- createBand(sample,
                                                  corArray,
                                                  bandwidth,
                                                  nonCoverageProbability)
    bandsArray
    }
}
