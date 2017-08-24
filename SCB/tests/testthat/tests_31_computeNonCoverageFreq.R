computeNonCoverageFreqFunction <- function()
{
  cat ("\n Testing \'computeNonCoverageFreq\'\n")
  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)
  myReplicationCount = 5
  myLag = 1
  myLagCount =4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05




  trueCorrelationArray = computeCor(lag = myLag, tvMa1CoefArray = mockTVMA1Array)


  nonCoverageFreq = computeNonCoverageFreq(
    sampleSize = mySampleSize,
    tParArray = mockTParArray,
    corArray = trueCorrelationArray
  )
  cat("NonCoverageFreqByCorBands:", nonCoverageFreq, "\n")

}
test_that("computeNonCoverageFreqByCorHats", {
  computeNonCoverageFreqFunction()
  cat(" End of test ","\n")
  cat("=====================")
})
