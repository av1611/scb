
computeNonCoverageFreqArrayFunction <- function() {
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


  tvMa1CoefArray <-
    createTVMA1CoefArray(coefFunction = myCoefFunction,
                         sampleSize = mySampleSize)
  corArray <- computeCor(lag = myLag,
                         tvMa1CoefArray = tvMa1CoefArray)


    nonCoverageFreqArray <- computeNonCoverageFreqArray(superReplicationCount = mySuperReplicationCount,
                                                  replicationCount = myReplicationCount,
                                                  sampleSize = mySampleSize,
                                                  lag = myLag,
                                                  tParArray = mockTParArray,
                                                  kernel = myKernel,
                                                  bandwidth = myBandwidth,
                                                  nonCoverageProbability = myNonCoverageProbability)

     cat("NonCoverageFreqArray:", nonCoverageFreqDist, "\n")
    cat("End of test of computeNonCoverageFreqDist", "\n")

}

test_that("Testing \'computeNonCoverageFreqDist\'", {
  computeNonCoverageFreqArrayFunction()
})
