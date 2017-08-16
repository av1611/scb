createBandsBrickFunction <- function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  myLag <- 2
  myTParCount <- 10
  myReplicationCount <- 10
  mySampleSize=10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
  mockNoise <- createNoise(sampleSize = myTParCount,
                           mean = 0,
                           sd = 1)
  mockSample <- createSample(sampleSize = mySampleSize)
  mockSampleSize = length(mockSample)

  mockBandsBrick <- createBandsBrick(lag = myLag,
                                     sampleSize = mySampleSize,
                                     replicationCount = myReplicationCount,
                                     bandwidth = 0.5,
                                     nonCoverageProbability = 0.05)

  cat("bandsArray", mockBandsBrick[1:5])
}
test_that("createBandsBrick", {
  createBandsBrickFunction()
}
)
