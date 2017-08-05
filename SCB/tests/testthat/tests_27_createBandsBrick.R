createBandsBrickfunction=function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  myLag=2
  myTParCount = 10
  replicationCount=10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockNoise <- createNoise(sampleSize = myTParCount,
                           mean = 0,
                           sd = 1)
  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array,
                             noise = mockNoise)
  sampleSize = length(mockSample)

  bandsArray <- array(0, dim = c(replicationCount, sampleSize, 2))

  for(repCountIndex in 1:replicationCount)
  {
    bandsArray[repCountIndex, , ] <- createBand(lag=myLag,sample = mockSample,
                                                  bandwidth=1,
                                                  nonCoverageProbability=0.05)
    bandsArray
  }
  cat("bandsArray",bandsArray[1:5])
}
test_that("createBandsBrick", {
  createBandsBrickfunction()
}
)
