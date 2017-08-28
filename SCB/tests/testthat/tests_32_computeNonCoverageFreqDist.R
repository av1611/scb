computeNonCoverageFreqDistFunction <- function() {
  cat("\n Testing \'computeNonCoverageFreqDist\' \n")

  myTParCount  <- 4
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 5
  mySampleSize <- 5
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05


  alphaHatArray <- array(0, dim = mySuperReplicationCount)
  tvMa1CoefArray <-
    createTVMA1CoefArray(coefFunction = myCoefFunction,
                         sampleSize = mySampleSize)
  corArray <- computeCor(lag = myLag,
                         tvMa1CoefArray = tvMa1CoefArray)

  # for (superIndex in 1:mySuperReplicationCount) {
  #  alphaHatArray[superIndex] <-
  #     computeNonCoverageFreq(
  #       replicationCount = myReplicationCount,
  #       sampleSize = mySampleSize,
  #       lag = myLag,
  #       tParArray = mockTParArray,
  #       corArray = corArray,
  #       kernel = myKernel,
  #       bandwidth = myBandwidth,
  #       nonCoverageProbability = myNonCoverageProbability
  #     )
  #
  #  }
  #
  # alphaHatArray
  #
    nonCoverageFreqDist <- computeNonCoverageFreqDist(superReplicationCount = mySuperReplicationCount,
                                                  replicationCount = myReplicationCount,
                                                  sampleSize = mySampleSize,
                                                  lag = myLag,
                                                  tParArray = mockTParArray,
                                                  kernel = myKernel,
                                                  bandwidth = myBandwidth,
                                                  nonCoverageProbability = myNonCoverageProbability)

     cat("NonCoverageFreqDist:", nonCoverageFreqDist, "\n")
    cat("End of test of computeNonCoverageFreqDist", "\n")

}

test_that("Testing \'computeNonCoverageFreqDist\'", {
  computeNonCoverageFreqDistFunction()
})
