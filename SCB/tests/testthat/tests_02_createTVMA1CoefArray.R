createTVMA1CoefArrayFunction <- function() {
  cat("\n Testing \'createTVMA1CoefArray\' for length and being numeric \n")
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,tParArray=mockTParArray)

  cat ("mockTVMA1CoefArray[1:5] =", mockTVMA1CoefArray[1:5], "\n",
       "length(mockTVMA1CoefArray) =", length(mockTVMA1CoefArray), "\n")
  expect_that(mockTVMA1CoefArray, is_a("numeric"))
}


test_that("Testing tests_createTVMA1CoefArray for length and being numeric", {
  createTVMA1CoefArrayFunction()
  }
)
