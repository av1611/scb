createBandFunction <- function() {
  cat("\n Testing \'createBand\'")
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

  cat("Band", mockBand,"\n")
  # # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
}

test_that("Testing \'createBand\'",
          createBandFunction())
