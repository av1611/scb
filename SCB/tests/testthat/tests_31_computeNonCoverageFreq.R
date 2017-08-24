computeNonCoverageFreqFunction <- function()
{
  cat ("\n Testing \'computeNonCoverageFreq\' \n")

  myTParCount  <- 10
  mockTParArray  <- createTParArray(tParCount = myTParCount)
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
