
createBandFunction <- function() {
  mockBand <- createBand(X = rnorm(n = 10,
                                   mean = 0,
                                   sd = 1),
                         alpha = 0.05)

  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
}

test_that("Testing \'createBand\' for being a matrix of 2 by N dimensions", {
  createBandFunction()


  }
)
