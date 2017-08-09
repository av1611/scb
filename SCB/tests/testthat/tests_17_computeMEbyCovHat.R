computeMEbyCovHatFunction <- function () {
  tParCount = 12
  lag = 2
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockSample <- createSample(tvMA1CoefArray = mockTVMA1CoefArray)
  myLagCount = tParCount - 1
  kernel = normalDifferenceKernel
  bandwidth = 1

  # this should return double array
  # lag is the first dimension
  # t or tPar is the second dimension
  mockCorHats <- computeAllCorHats(tParArray = mockTParArray,
                                  lagCount = myLagCount,
                                  sample = mockSample,
                                  kernel = kernel,
                                  bandwidth = 1)
  me <- computeMEbyCovHat(tParArray = mockTParArray,
                          lag = lag,
                          lagCount = myLagCount,
                          sample = mockSample,
                          kernel = normalDifferenceKernel,
                          bandwidth = 1,
                          nonCoverageProbability = 0.05,
                          C_K = -1.978325,
                          # int_sq_der = 0.306951,
                          PHI_K_NORMAL_DIFF = 0.4065)
  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

  cat("me = ", me)
}

test_that("Testing \'computeMEbyCovHat\'", {
  computeMEbyCovHatFunction()
}
)
