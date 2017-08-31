computeNonCoverageFreqArrayFunction <- function() {
  cat("\n Testing \'computeNonCoverageFreqArray\' \n")

  myTParCount  <- 2
  mockTParArray  <- createTParArray(tParCount = myTParCount)
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
    tParArray = mockTParArray,
    kernel = myKernel,
    bandwidth = myBandwidth,
    nonCoverageProbability = myNonCoverageProbability
  )

  cat("nonCoverageArray= ",nonCoverageFreqArray)

}

test_that("Testing \'computeNonCoverageFreqArray\'", {
  computeNonCoverageFreqArrayFunction()
  cat("\nEnd of test computeNonCoverageFreqArray", "\n")
  cat("=====================")
})
