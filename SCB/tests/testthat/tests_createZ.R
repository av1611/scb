test_that("Testing createZ for length", {
  mockZ <- createZ(sampleSize = 10,
                   mean = 0,
                   sd = 1)
  expect_that(mockZ, is_a("numeric"))
  expect_that(length(mockZ), equals(10))
  }
)
