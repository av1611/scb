computeIsCoveredFunction = function()
{
  cat ("\n Testing \'computeIsCovered\'\n")
  mySampleSize = 5
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)
  mockSample <- createSample(sampleSize = myTParCount)

  myLag =2
  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = 1
  # form all rho hats
  # first try fakes
  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockAllCorHat = computeAllCorHats(
    tParArray = mockTParArray,
    lagCount = myLagCount,
    sample = mockSample,
    kernel = normalDifferenceKernel,
    bandwidth = 1
  )
  mockBand <-
    createBand(
      tParArray = mockTParArray,
      lag = myLag,
      lagCount = myLagCount,
      bandwidth = 0.5,
      kernel = normalDifferenceKernel,
      sampleSize = 10,
      nonCoverageProbability = 0.05
    )

  mockTVMA1CoefArray <-
    createTVMA1CoefArray(coefFunction = myCoefFunction,
                         sampleSize = mySampleSize)

  mockCor <-
    computeCor(lag = myLag, tvMa1CoefArray = mockTVMA1CoefArray)


  isCovered <- computeIsCovered(mockBand,
                                mockCor)

  cat("IsCovered:", isCovered, "\n")
}

test_that("Testing computeIsCovered", {
  computeIsCoveredFunction()
})
