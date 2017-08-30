createSampleFunction <- function ()
{
  cat("\n Testing \'createSample\' for length and being numeric \n")
  mySampleSize = 40
  mockSample <- createSample(sampleSize = mySampleSize)
  cat ("mockSample[1:5] =", mockSample[1:5], "\n")
  expect_that(mockSample, is_a("array"))
}



test_that("Testing \'createSample\' for length and being numeric",
{
  createSampleFunction()
  cat(" End of test createSample","\n")
  cat("=====================")
}
)
