saveNonCoverageFreqArrayFunction <- function()
{
  cat ("\n Testing \'saveNonCoverageFreqArray\'\n")

  myTParCount  <-2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 4
  myReplicationCount <- 4
  mySampleSize <- 50
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05

  nonCoverageFreqArray = computeNonCoverageFreqArray(
    superReplicationCount = mySuperReplicationCount,
    replicationCount = myReplicationCount,
    sampleSize = mySampleSize,
    lag = myLag,
    lagCount = myLagCount,
    tParArray = myTParArray,
    kernel = myKernel,
    bandwidth = myBandwidth,
    nonCoverageProbability = myNonCoverageProbability
  )

  nonCoverageProbability <- myNonCoverageProbability
  alphaHatArray <- nonCoverageFreqArray

  fileName <- paste("ss", mySampleSize, "l", myLag, "tPar", length(myTParArray), "alpha"
                    , myNonCoverageProbability, sep = "_")
  fileName <- paste(fileName, "repC", myReplicationCount, sep = "_")

  saveNonCoverageFreqArray(nonCoverageProbability = nonCoverageProbability,
                                   alphaHatArray = alphaHatArray, fileName = fileName)
}

test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveNonCoverageFreqArray()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})
