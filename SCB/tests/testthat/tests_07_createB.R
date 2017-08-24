createBFunction<-function()
{
  cat("\n Testing \'createB\' \n")
  mySampleSize = 10
  b <- computeB(mySampleSize)
  cat("bandwidth =", b, "\n")
}
  test_that("Testing  \'createB\'", {
    createBFunction()
    cat(" End of test ","\n")
    cat("=====================")
  }
  )

