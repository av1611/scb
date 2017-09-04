saveDoubleAplhaHatArrayFunction <- function()
{
  cat ("\n Testing \'saveDoubleAplhaHatArray\'\n")
  myTParCount  <- 2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 6
  myReplicationCount <- 7
  mySampleSize <- 8
  myLag <- 1
  myLagCount <- 3
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  NonCoverageProbabilities <- c(0.2,0.4,0.6,0.8)

  alphaHats <- matrix(0,nrow = mySuperReplicationCount, ncol = length(NonCoverageProbabilities))
  for(i in 1:length(NonCoverageProbabilities))
  {
    alphaHats[,i] <- computeNonCoverageFreqArray(
    superReplicationCount = mySuperReplicationCount,
    replicationCount = myReplicationCount,
    sampleSize = mySampleSize,
    lag = myLag,
    lagCount = myLagCount,
    tParArray = myTParArray,
    kernel = myKernel,
    bandwidth = myBandwidth,
    nonCoverageProbability = NonCoverageProbabilities[i])
  }

  fileName <- paste("ss", mySampleSize, "l", myLag, "bandW", myBandwidth, "alpha"
                    , NonCoverageProbabilities, sep = "_")
  fileName <- paste(fileName, "repC", myReplicationCount,"SrepC",mySuperReplicationCount, sep = "_")
  saveDoubleAplhaHatArray(nonCoverageProbabilities = NonCoverageProbabilities,
                          alphaHats = alphaHats,fileName = fileName)
}
test_that("Testing \'saveNonCoverageFreqArray\'", {
  saveDoubleAplhaHatArrayFunction()
  cat("\nEnd of test saveNonCoverageFreqArray", "\n")
  cat("=====================")
})
