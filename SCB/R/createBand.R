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

createBand <- function(lag,
                       sampleSize,
                       bandwidth = 1,
                       nonCoverageProbability = 0.05)
{
  # createSampe
  # get the real correlation computeCor
  # call ME (sample, bandwidth, nonCoverageProbability)
  # upper = corArray + ME
  # upper = corArray + ME
  myTParCount = 10
  myLag = 0

  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockComputeCor <- computeCorHat(tParArray = mockTParArray,lag=lag,sample = sample,kernel = normalDifferenceKernel)


  meByCovHat <- computeMEbyCovHat(lag=lag,
                                  sample=sample,
                                  bandwidth=1,
                                  nonCoverageProbability=0.05)
  lowerBound <- mockComputeCor - meByCovHat
  upperBound <- mockComputeCor + meByCovHat
  band <- rbind(lowerBound, upperBound)
}
