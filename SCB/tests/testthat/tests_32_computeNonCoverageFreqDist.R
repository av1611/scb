computeNonCoverageFreqDistFunction <- function() {
  cat("\n Testing \'computeNonCoverageFreqDist\' \n")

  myTParCount  <- 10
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 10
  myReplicationCount <- 10
  mySampleSize <- 10
  myLag <- 3
  myLagCount <- myReplicationCount - 1
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             sampleSize = mySampleSize)

  trueCorArray <- computeCor(lag = lag,
                             tvMa1CoefArray = mockTVMA1CoefArray)
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05

  trueCorrelationArray <- computeCor(lag = myLag,
                                     tvMa1CoefArray = mockTVMA1Array)


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
#   computeNonCoverageFreqByRhoBandsFunction()
}
)
