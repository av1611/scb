computeNonCoverageFreqDistFunction <- function() {
  cat("\n Testing \'computeNonCoverageFreqDist\' \n")

  myTParCount  <- 3
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 5
  mySampleSize <- 8
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05



  nonCoverageFreqDist <- computeNonCoverageFreqDist(superReplicationCount = mySuperReplicationCount,
                                                replicationCount = myReplicationCount,
                                                sampleSize = mySampleSize,
                                                lag = myLag,
                                                tParArray = mockTParArray,
                                                kernel = myKernel,
                                                bandwidth = myBandwidth,
                                                nonCoverageProbability = myNonCoverageProbability)

  cat("NonCoverageFreqDist:", nonCoverageFreqDist, "\n")
  cat("End of test of \'computeNonCoverageFreqDist\' \n")
}

test_that("Testing \'computeNonCoverageFreqDist\'", {
  computeNonCoverageFreqDistFunction()
}
)
