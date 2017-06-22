createTParArrayFunction <- function () {
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
}



test_that("Testing \'createTParArray\' for being a matrix of 2 by N dimensions", {
  mockTParArray <- createTParArrayFunction()

  # expect_that(mockTParArray, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
  }
)
