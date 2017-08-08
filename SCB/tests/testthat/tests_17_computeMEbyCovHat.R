computeMEbyCovHatFunction <- function () {
  cat("\n Testing \'computeMEbyCovHat\' \n")
  myTParCount = 10
  lag = 2
  lagCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)

  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)

  mockSample <- createSample(tvMA1CoefArray = mockTVMA1CoefArray)
  me <- computeMEbyCovHat(tParArray = mockTParArray,
                          lag = lag,
                          lagCount = lagCount,
                          sample = mockSample,
                          kernel = normalDifferenceKernel,
                          bandwidth = 1,
                          nonCoverageProbability = 0.05,
                          ck = -1.978325,
                          # int_sq_der = 0.306951,
                          phi_k_normal_diff = 0.4065)
  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

  cat("ME", me)
}

test_that("Testing \'computeMEbyCovHat\'", {
  computeMEbyCovHatFunction()
}
)
