computeNonCoverageFreqFunction <- function()

{
  cat ("\n Testing \'computeNonCoverageFreq\' \n")

  myTParCount  <-2
  mockTParArray  <- createTParArray(tParCount = myTParCount)
  myReplicationCount <- 4
  mySampleSize <-8
  myLag <- 1
  myLagCount <- 4
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             sampleSize = mySampleSize)

  trueCorArray <- computeCor(lag = myLag,
                             tvMa1CoefArray = mockTVMA1CoefArray)


  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05
  bandsBrick = createBandsBrick(sampleSize = mySampleSize,
                                tParArray  = mockTParArray,
                                lag        = myLag,
                                lagCount   = myLagCount,
                                bandwidth  = myBandwidth,
                                kernel     = normalDifferenceKernel,
                                nonCoverageProbability = myNonCoverageProbability,
                                replicationCount       = myReplicationCount)
   isCoveredArray <- computeIsCoveredArray(bandsBrick,
                                      trueCorArray)
   cat("\ncompute is covered array",isCoveredArray)
  zeroCount = 0
  replicationCount = dim(bandsBrick)[1]
  cat("replication Count",replicationCount)
  for (i in 1:length(isCoveredArray)) {
    if (isCoveredArray[i] == 0) {
      zeroCount <- zeroCount + 1
    }
  }
cat("zeroCount",zeroCount)
  nonCoverageFreq <- zeroCount / replicationCount
 # nonCoverageFreq <- computeNonCoverageFreq(replicationCount = myReplicationCount,
 #                                          sampleSize = mySampleSize,
 #                                          lag = myLag,
 #                                         tParArray = mockTParArray,
 #                                          corArray = trueCorArray,
 #                                          kernel = myKernel,
 #                                          bandwidth = myBandwidth,
 #                                          nonCoverageProbability = myNonCoverageProbability)

 cat("NonCoverageFreq:", nonCoverageFreq, "\n")
   cat("End of test of computeNonCoverageFreq","\n")
   cat("=====================")
}

test_that("computeNonCoverageFreqDist", {
  computeNonCoverageFreqFunction()
})

