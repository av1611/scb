computeIsCoveredfunction=function()
{
  cat ("\n Testing \'computeIsCovered\'\n")
  tParCount = 10
  lagCount = 10
  lag = 2
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockBand <- createBand(tParArray = mockTParArray,
                         lag = lag,
                         lagCount = lagCount,
                         bandwidth = 1,
                         kernel = normalDifferenceKernel,
                         nonCoverageProbability = 0.05)
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockNoise <- createNoise(sampleSize = tParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)
  correlation <- computeCor(lag = lag,
                            tvMa1CoefArray = mockTVMA1CoeffArray)
  covered <- computeIsCovered(band, correlation)
  cat("IsCovered:", covered, "\n")
}
test_that("Testing computeIsCovered", {
  computeIsCoveredfunction()
})

