saveNonCoverageFreqArrayFunction <- function()
{
  cat ("\n Testing \'saveNonCoverageFreqArray\'\n")

  myTParCount  <-2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 4
  mySampleSize <- 50
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05

  nonCoverageFreqArray = computeNonCoverageFreqArray(
    superReplicationCount = mySuperReplicationCount,
    replicationCount = myReplicationCount,
    sampleSize = mySampleSize,
    lag = myLag,
    lagCount = myLagCount,
    tParArray = myTParArray,
    kernel = myKernel,
    bandwidth = myBandwidth,
    nonCoverageProbability = myNonCoverageProbability
  )

  nonCoverageProbability <- myNonCoverageProbability
  alphaHatArray <- nonCoverageFreqArray

  saveNonCoverageFreqArray(nonCoverageProbability = nonCoverageProbability,
                                   alphaHatArray = alphaHatArray)
}

test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveNonCoverageFreqArray()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})
