createBandFunction <- function() {
  cat("\n Testing \'createBand\' for length and being numeric \n")
  mockBand <- createBand(lag = 2,bandwidth = 0.5,nonCoverageProbability = 0.05)

  cat ("mockBand =", mockBand, "\n")
  # # expect_that(mockBand, is_a("matrix"))
  # # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
}

test_that("Testing \'createBand\'",
          createBandFunction())
