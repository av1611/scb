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
                       bandwidth = 1,
                       nonCoverageProbability = 0.05) {
  # get the real correlation computeCor
  # call ME (sample, bandwidth, nonCoverageProbability)
  # upper = corArray + ME
  # upper = corArray + ME


  myLag = 0


  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockNoise <- createNoise(sampleSize = myTParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array,
                             noise = mockNoise)


  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockComputeCor <- computeCorHat(tParArray = mockTParArray,lag=lag,sample = sample,kernel = normalDifferenceKernel)


  meByCovHat <- computeMEbyCovHat(lag=myLag,
                                  sample=mockSample,
                                  bandwidth=1,
                                  nonCoverageProbability=0.05)
  lowerBound <- mockComputeCor - meByCovHat
  upperBound <- mockComputeCor + meByCovHat
  band <- rbind(lowerBound, upperBound)
}
