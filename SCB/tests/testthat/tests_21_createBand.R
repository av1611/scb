createBandFunction <- function() {
  cat("\n Testing \'createBand\' \n ")
  tParCount = 12
  myLagCount = tParCount - 1
  lag = 2

  TParArray <- createTParArray(tParCount = tParCount)
  sample=createSample(tvMA1CoefArray = TParArray)
  mockCorHats = computeAllCorHats(tParArray = TParArray,
                                  lagCount = myLagCount,
                                  sample = sample,
                                  kernel = kernel,
                                  bandwidth = 1)
  mockBand <- createBand(tParArray = mockTParArray,
                         lag = lag,
                         lagCount = lagCount,
                         bandwidth = 1,
                         kernel = normalDifferenceKernel,
                         nonCoverageProbability = 0.05)

  cat("Band", mockBand,"\n")
  # # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
}

test_that("Testing \'createBand\'",
          createBandFunction())
