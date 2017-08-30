createTVMA1CoefArrayFunction <- function() {
  cat("\n Testing \'createTVMA1CoefArray\' for length and being numeric \n")

  tParCount = 10
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,tParCount=tParCount)

  cat ("mockTVMA1CoefArray =", mockTVMA1CoefArray[1:tParCount], "\n",
       "length(mockTVMA1CoefArray) =", length(mockTVMA1CoefArray), "\n")
 #expect_that(mockTVMA1CoefArray, is_a("numeric"))

}



test_that("Testing tests_createTVMA1CoefArray for length and being numeric", {
  createTVMA1CoefArrayFunction()
  cat(" End of test createTVMA1CoefArray","\n")
  cat("=====================")
  }
)
