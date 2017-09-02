computeIsCoveredFunction = function()
{
  cat ("\n Testing \'computeIsCovered\'\n")

  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)

myCoefFunction=sin

  myLag = 2

  myLagCount =4
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

  mockCor <- computeCor(lag = myLag,coefFunction = sin,tParArray = mockTParArray)

Start=Sys.time()
  isCovered <- computeIsCovered(mockBand,
                                mockCor)
  End=Sys.time()
  Duration=End-Start


  cat("\nIsCovered:",isCovered, "\n")
  cat("Duration",Duration,"\n")
}

test_that("Testing computeIsCovered", {
  computeIsCoveredFunction()
  cat("End of test computeIsCovered","\n")
  cat("=====================")
})
