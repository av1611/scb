createTParArrayFunction <- function () {
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  # The actual testing
  expect_that(mockTParArray, is_a("array"))
}



test_that("Testing \'createTParArray\' for being a matrix of 2 by N dimensions", {
  mockTParArray <- createTParArrayFunction()

  }
)
