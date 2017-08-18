computeIsCoveredArrayFunction <- function()
{
  cat("\n Testing \'computeIsCoveredArray\'\n")

  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)

  myCoefFunction=sin

  myLag = 3

  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05

  mockCorArray <- computeCor(lag = myLag,
                             tvMa1CoefArray = mockTVMA1Array)
  cat("\n mockCorAr", mockCorArray)
  #
  #   lowerBound <- seq(from = 0, to = 1, by = 0.1)
  #   upperBound <- seq(from = 1, to = 2, by = 0.1)
  #   mockBand <- cbind(lowerBound, upperBound)
  #
  #   mockBandsBrick <-
  #     array(mockBand, dim = c(tParCount, mySampleSize, replicationCount))

  mockBandsBrick <-
    createBandsBrick(
      tParArray = mockTParArray,
      lag = myLag,
      lagCount = myLagCount,
      bandwidth = myBandwidth,
      kernel = myKernel,
      sampleSize = mySampleSize,
      nonCoverageProbability = 0.05,
      replicationCount = 4
    )
      isCoveredArray <-
        computeIsCoveredArray(bandsBrick = mockBandsBrick,
                              corArray = mockCorArray)

      cat("isCoveredArray:", mockBandsBrick, "\n")
}

test_that("Testing \'isCoveredArray\'", {
  computeIsCoveredArrayFunction()
})

