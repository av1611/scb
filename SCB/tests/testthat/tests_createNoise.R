test_that("Testing createNoise for length", {
  set.seed(100)
  mockNoise <- createNoise(sampleSize = 10,
                           mean = 0,
                           sd = 1)
  set.seed(100)
  mockRnorm <- rnorm(n = 10,
                     mean = 0,
                     sd = 1)
  expect_that(mockNoise, is_a("numeric"))
  expect_that(mockNoise, equals(mockRnorm))
  }
)
