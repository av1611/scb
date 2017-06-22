createTVMA1CoefArrayFunction <- function() {
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(model = sin,
                                             tParArray = mockTParArray)
}


test_that("Testing tests_createTVMA1CoefArray for length and being numeric", {
  mockTVMA1CoefArray <- createTVMA1CoefArrayFunction()
  expect_that(mockTVMA1CoefArray, is_a("numeric"))
  expect_that(length(mockTVMA1CoefArray), equals(tParCount))
  }
)
