test_that("Testing tests_createTVMA1CoefArray for length and being numeric", {
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(model = sin,
                                             tParArray = mockTParArray)
  expect_that(mockTVMA1CoefArray, is_a("numeric"))
  expect_that(length(mockTVMA1CoefArray), equals(tParCount))
  }
)
