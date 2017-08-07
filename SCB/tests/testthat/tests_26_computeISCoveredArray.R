computeIsCoveredArrayFunction=function()
{
  cat("\n Testing \'computeIsCoveredArray\'\n")
  myLag=2
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockNoise <- createNoise(sampleSize = tParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(tvMA1CoefArray = mockTVMA1CoeffArray,
                           noise = mockNoise)
  Cor=computeCor(lag=myLag,tvMa1CoefArray = mockTVMA1)
  BandsBrick=createBandsBrick(replicationCount = 10,bandwidth = 0.5,nonCoverageProbability = 0.05)
  isCoveredArray=computeIsCoveredArray(bandsBrick = BandsBrick,corArray = Cor)
  cat("isCoveredArray",isCoveredArray[1,5])

}
test_that("Testing \'isCoveredArray\'",
          computeIsCoveredArrayFunction()  )
