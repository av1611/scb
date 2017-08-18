computeNonCoverageFreqFunction <- function()
{
  cat ("\n Testing \'computeNonCoverageFreq\'\n")
  mySampleSize = 10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <-
    createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)
  myReplicationCount = 4
  myLag = 3
  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability = 0.05


  bandsBrick = createBandsBrick(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = normalDifferenceKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability,
    replicationCount = myReplicationCount
  )

  trueCorrelationArray = computeCor(lag = myLag, tvMa1CoefArray = mockTVMA1Array)

  cat("sampleSize:", mySampleSize, "\n")


  nonCoverageFreq = computeNonCoverageFreq(
    sampleSize = mySampleSize,
    tParArray = mockTParArray,
    corArray = trueCorrelationArray,
    bandsArray = bandsBrick
  )

  cat("NonCoverageFreqByCorBands:", nonCoverageFreq, "\n")

}
test_that("computeNonCoverageFreqByCorHats", {
  computeNonCoverageFreqFunction()
})
