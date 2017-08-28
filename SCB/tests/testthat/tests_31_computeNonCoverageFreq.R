computeNonCoverageFreqFunction <- function()

{
  cat ("\n Testing \'computeNonCoverageFreq\' \n")

  myTParCount  <- 10
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  myReplicationCount <- 8
  mySampleSize <- 10
  myLag <- 1
  myLagCount <- 3
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
   cat("End of test of computeNonCoverageFreq","\n")
   cat("=====================")
}

test_that("computeNonCoverageFreqDist", {
  computeNonCoverageFreqFunction()
})
