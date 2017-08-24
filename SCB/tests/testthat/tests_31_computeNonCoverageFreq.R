computeNonCoverageFreqFunction <- function()

{
  cat ("\n Testing \'computeNonCoverageFreq\' \n")

  myTParCount  <- 10
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  myReplicationCount <- 7
  mySampleSize <- 9
  myLag <- 2
  myLagCount <- myReplicationCount - 1
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             sampleSize = mySampleSize)

  trueCorArray <- computeCor(lag = myLag,
                             tvMa1CoefArray = mockTVMA1CoefArray)
  cat("\n length of trueCorArray = ", length(trueCorArray), "\n")

  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05

  nonCoverageFreq <- computeNonCoverageFreq(replicationCount = myReplicationCount,
                                           sampleSize = mySampleSize,
                                           lag = myLag,
                                           tParArray = mockTParArray,
                                           corArray = trueCorArray,
                                           kernel = myKernel,
                                           bandwidth = myBandwidth,
                                           nonCoverageProbability = myNonCoverageProbability)

  cat("NonCoverageFreq:", nonCoverageFreq, "\n")
  cat("End of test of \'computeNonCoverageFreq\' \n")
}

test_that("computeNonCoverageFreqDist", {
  computeNonCoverageFreqFunction()
})
