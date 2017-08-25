computeNonCoverageFreqFunction <- function()

{
  cat ("\n Testing \'computeNonCoverageFreq\' \n")

  myTParCount  <- 2
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  myReplicationCount <- 5
  mySampleSize <- 8
  myLag <- 1
  myLagCount <- 4
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             sampleSize = mySampleSize)

  trueCorArray <- computeCor(lag = myLag,
                             tvMa1CoefArray = mockTVMA1CoefArray)


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
