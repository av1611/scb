createBandsBrickFunction <- function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  myLag <- 2
  myTParCount <- 10
  myReplicationCount <- 10

  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockNoise <- createNoise(sampleSize = myTParCount,
                           mean = 0,
                           sd = 1)
  mockSample <- createSample(tvMA1CoefArray = mockTVMA1Array)
  mockSampleSize = length(mockSample)

  mockBandsBrick <- createBandsBrick(lag = myLag,
                                     sampleSize = mockSampleSize,
                                     replicationCount = myReplicationCount,
                                     bandwidth = 1,
                                     nonCoverageProbability = 0.05)

  cat("bandsArray", mockBandsBrick[1:5])
}
test_that("createBandsBrick", {
  createBandsBrickfunction()
}
)
