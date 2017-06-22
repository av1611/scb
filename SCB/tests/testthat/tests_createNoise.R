createNoiseFunction <- function () {
  set.seed(100)
  mockNoise <- createNoise(sampleSize = 10,
                           mean = 0,
                           sd = 1)
  set.seed(100)
  mockRnorm <- rnorm(n = 10,
                     mean = 0,
                     sd = 1)


}

test_that("Testing \'createMultiplierCovarianceByKernel\'", {
  mockRnorm <- createNoiseFunction()

  expect_that(mockRnorm, is_a("matrix"))
  expect_that(dim(mockRnorm)[1], equals(2))  # the number of rows
  expect_that(dim(mockRnorm)[2], equals(10)) # the number of cols
}
)



test_that("Testing createNoise for length", {

  }
)
