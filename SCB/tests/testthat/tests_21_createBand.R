createBandFunction <- function()
{
  cat("\n Testing \'createBand\' \n ")
  mySampleSize = 50
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)



  myLag = 2
  myLagCount = 4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05

  band = createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability
  )


cat("\nsize of band",length(band))
  cat("\nband1", band)

}

test_that("Testing \'createBand\'", {
  createBandFunction()
  cat("\nEnd of test createBand", "\n")
  cat("=====================")
})
