test_that("Testing createTVMA1 for length and being numeric", {
  mockTParArray <- createTParArray(tParCount = 10)
  mockNoise <- createNoise(sampleSize = 10,
                            mean = 0,
                            sd = 1)
  mockTVMA1Array <- createTVMA1Array(model = sin,
                                     tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(sampleSize = 10,
                           tvMA1CoefArray = mockPsi,
                           noise = mockNoise)
  expect_that(mockTVMA1, is_a("array"))
  expect_that(length(mockTVMA1), equals(10))
  }
)
