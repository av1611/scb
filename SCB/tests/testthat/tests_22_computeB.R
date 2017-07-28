computeBFunction <- function() {
  cat ("\n Testing \'computeB\' for for being numeric (for values from 1 to 5)\n")
  myN = c(1:5)
  mockB <- computeB(n = myN)
  cat ("mockB[1:5] =", mockB[1:5], "\n")

  # The actual testing
  expect_that(mockB, is_a("numeric"))
}

test_that("Testing \'computeB\' for being a numeric (for values from 1 to 5)", {
  mockB <- computeBFunction()
}
)

