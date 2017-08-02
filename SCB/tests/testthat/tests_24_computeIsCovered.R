computeIsCoveredfunction=function()
{
  cat ("\n Testing \'computeIsCovered\'\n")

  band=createBand(X = rnorm(n = 10, mean = 0, sd = 1), alpha = 0.05)
  myLag=2
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockNoise <- createNoise(sampleSize = tParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(sampleSize = tParCount,
                           tvMA1CoefArray = mockTVMA1CoeffArray,
                           noise = mockNoise)
  Cor=computeCor(lag=myLag,tvMa1CoefArray = mockTVMA1)
  IsCovered=computeIsCovered(band,Cor)
  cat("IsCovered:",IsCovered,"\n")
}
test_that("Testing computeIsCovered", {
  computeIsCoveredfunction()
}
)
