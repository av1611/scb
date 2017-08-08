computeMEfunction=function()
{
  cat ("\n Testing \'computeME\'\n")
  myLag <- 2
  myLagCount <- 10
  myNoise <- rnorm(n = 10,
                   mean = 0,
                   sd = 1)
  myTParCount <- 10
  mockTParArray <- createTParArray(tParCount = myTParCount)

  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)

  mockSample <- createSample(tvMA1CoefArray = mockTVMA1CoefArray)

  ck <- computeMEbyCovHat(tParArray = mockTParArray,
                          lag = myLag,
                          lagCount = myLagCount,
                          sample = mockSample,
                          kernel = normalDifferenceKernel,
                          bandwidth = 1,
                          nonCoverageProbability = 0.05,
                          ck = -1.978325,
                          # int_sq_der = 0.306951,
                          phi_k_normal_diff = 0.4065)

  cat("ME", ck, "\n")
}

test_that("Testing \'computeME\' ", {
  computeMEfunction()
  }
)
