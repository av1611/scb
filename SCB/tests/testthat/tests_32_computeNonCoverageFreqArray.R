

computeNonCoverageFreqArrayFunction <- function() {
  cat("\n Testing \'computeNonCoverageFreqArray\' \n")

  myTParCount  <- 2
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 4
  mySampleSize <- 5
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05



  corArray <-
    computeCor(lag = myLag,
               coefFunction = sin,
               tParArray = mockTParArray)


  nonCoverageFreqArray <-
    computeNonCoverageFreqArray(
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

  cat("NonCoverageFreqArray:", nonCoverageFreqDist, "\n")
  cat("End of test of computeNonCoverageFreqDist", "\n")

}

test_that("Testing \'computeNonCoverageFreqArray\'", {
  computeNonCoverageFreqArrayFunction()
})
