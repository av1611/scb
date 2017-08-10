#' @title createBand

#' @name createBand
#'
#' @aliases createConfidenceBand
#'
#' @description Create a confidence intervals band.
#'
#' @param lag lag value.
#' @param sample a vector of \code{sample}.
#' @param corArray a vector of \code{corArray}.
#' @param bandwidth a kernel bandwidth value.
#' @param nonCoverageProbability the probability of non-covering the real values with the estimated ones. \code{alpha = 0.05} by default.
#'
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#'
#' @examples
#'

createBand <- function(tParArray,
                       lag,
                       lagCount,
                       bandwidth = 1,
                       kernel = normalDifferenceKernel,
                       nonCoverageProbability = 0.05,
                       allCorHats)
{
  # get the real correlation computeCor
  # call ME (sample, bandwidth, nonCoverageProbability)
  # upper = corArray + ME
  # upper = corArray + ME
  sample <- createSample(tvMA1CoefArray = tParArray)
  meByCovHat <- computeMEbyCovHat(tParArray = tParArray,
                                  lag = lag,
                                  lagCount = lagCount,
                                  sample = sample,
                                  bandwidth = bandwidth,
                                  nonCoverageProbability = nonCoverageProbability,
                                  C_K = -1.978325,
                                  PHI_K_NORMAL_DIFF = 0.4065)
  lowerBound <- corHat - meByCovHat
  upperBound <- corHat + meByCovHat
  band <- cbind(lowerBound, upperBound)
}
