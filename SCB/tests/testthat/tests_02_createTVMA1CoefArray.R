createTVMA1CoefArrayFunction <- function() {
  cat("\n Testing \'createTVMA1CoefArray\' for length and being numeric \n")

  sampleSize = 40
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,sampleSize = sampleSize)

  cat ("mockTVMA1CoefArray =", mockTVMA1CoefArray[1:sampleSize], "\n",
       "length(mockTVMA1CoefArray) =", length(mockTVMA1CoefArray), "\n")
 #expect_that(mockTVMA1CoefArray, is_a("numeric"))

}



test_that("Testing tests_createTVMA1CoefArray for length and being numeric", {
  createTVMA1CoefArrayFunction()
  cat(" End of test createTVMA1CoefArray","\n")
  cat("=====================")
  }
)
