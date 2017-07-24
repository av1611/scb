createbFunction<-function()
{
  cat("\n Testing \'compute B\' \n")
  mySampleSize=10
  createCovHat<-computeB(mySampleSize)
  cat("\n computeB ",createCovHat)
}
  test_that("Testing  \'create CovHat\'", {
    createbFunction()
  }
  )

