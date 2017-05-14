test_that("Testing createNoise for length", {
  mockNoise <- createNoise(time = 10,
                   mean = 0,
                   sd = 1)
  expect_that(mockNoise, is_a("numeric"))
  expect_that(length(mockNoise), equals(10))
  }
)
