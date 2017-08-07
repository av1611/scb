createBandFunction <- function() {
  cat("\n Testing \'createBand\' for length and being numeric \n")
  mockBand <- createBand(lag = 2,bandwidth = 0.5,nonCoverageProbability = 0.05)
<<<<<<< HEAD
  cat("Band",mockBand,"\n")
=======

  cat ("mockBand =", mockBand, "\n")
  # # expect_that(mockBand, is_a("matrix"))
>>>>>>> bf58bf26474cf8b7ed2e7528d7c0400458bb93bd
  # # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
}

test_that("Testing \'createBand\'",
          createBandFunction())
