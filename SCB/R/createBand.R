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
#' createBand(X = rnorm(n = 10, mean = 0, sd = 1), alpha = 0.05))

createBand <- function(tParArray,
                       lag,
                       sample,
                       bandwidth = 1,
                       kernel = normalDifferenceKernel,
                       nonCoverageProbability = 0.05)
{
  # get the real correlation computeCor
  # call ME (sample, bandwidth, nonCoverageProbability)
  # upper = corArray + ME
  # upper = corArray + ME
  corHat <- computeCorHat(tParArray = tParArray,
                              lag = lag,
                              sample = sample,
                              kernel = kernel,
                              bandwidth = bandwidth)
  meByCovHat <- computeMEbyCovHat(lag = lag,
                                  sample = sample,
                                  bandwidth = bandwidth,
                                  nonCoverageProbability = nonCoverageProbability)
  lowerBound <- corHat - meByCovHat
  upperBound <- corHat + meByCovHat
  band <- rbind(lowerBound, upperBound)
}
