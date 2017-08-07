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


<<<<<<< HEAD
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockNoise <- createNoise(sampleSize = 10,
                           mean = 0,
                           sd = 1)
=======
  myLag = 0


  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different

>>>>>>> bf58bf26474cf8b7ed2e7528d7c0400458bb93bd
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array)
<<<<<<< HEAD
  myKernel = normalDifferenceKernel

  mockCorHat <- computeCorHat(tParArray = mockTParArray,
                              lag,
                              sample = mockSample,
                              kernel = myKernel,
                              bandwidth )
=======


  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockComputeCor <- computeCorHat(tParArray = mockTParArray,lag=lag,sample = sample,kernel = normalDifferenceKernel)


>>>>>>> bf58bf26474cf8b7ed2e7528d7c0400458bb93bd
  meByCovHat <- computeMEbyCovHat(lag,
                                  sample=mockSample,
                                  bandwidth,
                                  nonCoverageProbability=0.05)
  lowerBound <- mockCorHat - meByCovHat
  upperBound <- mockCorHat + meByCovHat
  band <- rbind(lowerBound, upperBound)
}
