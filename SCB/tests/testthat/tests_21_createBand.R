createBandFunction <- function()
{
  cat("\n Testing \'createBand\' \n ")
  mySampleSize=10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)



  myLag = 3
  myLagCount = 4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability=0.05

   band1 = createBand(
    tParArray = mockTParArray,
    lag = myLag,
   lagCount = myLagCount,
  bandwidth = myBandwidth,
   kernel = myKernel,
  sampleSize = mySampleSize,
  nonCoverageProbability = myNonCoverageProbability )

  cat("\n band1", band1)
}

test_that("Testing \'createBand\'",
          createBandFunction())
