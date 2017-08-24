createNoiseFunction <- function () {
  cat("\n Testing \'createNoise\' for length and being numeric \n")
  set.seed(100)
  mySampleSize = 10
  mockNoise <- createNoise(sampleSize = mySampleSize,
                           mean = 0,
                           sd = 1)
  set.seed(100)
  mockRnorm <- rnorm(n = mySampleSize,
                     mean = 0,
                     sd = 1)


  cat ("mockNoise[1:5] =", mockRnorm[1:5], "\n")
  cat ("length(mockNoise) =", length(mockNoise), "\n")


  expect_that(mockRnorm, is_a("numeric"))
}

test_that("Testing \'createNoise\' for length and being numeric\'", {
  mockRnorm <- createNoiseFunction()
  cat(" End of test ","\n")
  cat("=====================")

}
)




