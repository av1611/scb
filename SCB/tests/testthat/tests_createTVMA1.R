test_that("Testing createTVMA1 for length and being numeric", {
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockNoise <- createNoise(sampleSize = tParCount,
                            mean = 0,
                            sd = 1)
  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(sampleSize = tParCount,
                           tvMA1CoefArray = mockTVMA1CoeffArray,
                           noise = mockNoise)
  expect_that(mockTVMA1, is_a("array"))
  expect_that(length(mockTVMA1), equals(tParCount))
  }
)
