computeIsCoveredfunction=function()
{
  cat ("\n Testing \'computeIsCovered\'\n")

  band=createBand(lag = 2,bandwidth = 0.5,nonCoverageProbability = 0.05)
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
  Covered=computeIsCovered(band,Cor)
  cat("IsCovered:",Covered,"\n")
}
test_that("Testing computeIsCovered", {
  computeIsCoveredfunction()
})

