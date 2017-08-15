createBandFunction <- function()
{
  cat("\n Testing \'createBand\' \n ")
  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)

  mockSample <- createSample(sampleSize = myTParCount)

  myLag = 3
  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05
  # form all rho hats
  # first try fakes
  mockAllCorHats <- computeAllCorHats(
    tParArray = mockTParArray,
    lagCount = myLagCount,
    sample = mockSample,
    kernel = myKernel,
    bandwidth = myBandwidth
  )

  # # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
  band = createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = 0.5,
    kernel = myKernel,
    sampleSize = 10,
    nonCoverageProbability = 0.05,
    allCorHats = mockAllCorHat)

cat("band \n",band)
}

test_that("Testing \'createBand\'",
          createBandFunction())
