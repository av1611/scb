computeIsCoveredFunction = function()
{
  cat ("\n Testing \'computeIsCovered\'\n")

  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)

<<<<<<< HEAD
myCoefFunction=sin

  myLag = 3
=======
  myLag =1
>>>>>>> a5cd5676f6ea77f8f6ef69e6dce2cd92c6d25580
  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05

  mockBand = createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )

  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = myCoefFunction,
                                             sampleSize = mySampleSize)

  mockCor <- computeCor(lag = myLag,
                        tvMa1CoefArray = mockTVMA1CoefArray)


  isCovered <- computeIsCovered(mockBand,
                                mockCor)

  cat("IsCovered:",isCovered, "\n")
}

test_that("Testing computeIsCovered", {
  computeIsCoveredFunction()
})
