createNonCoverageFreqDoubleArrayFunction <- function () {
  cat("\n Testing \'createNonCoverageFreqDoubleArray\' \n")
  myAlphaCount = 8
  myTParCount  <- 2
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 8
  myReplicationCount <- 6
  mySampleSize <- 10
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbability <- 0.05
  Start=Sys.time()
  doubleAlphaArray = createDoubleAlphaArray(
    alphaCount = myAlphaCount,
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
  End=Sys.time()
  duration=End-Start
  cat("DoubleAlphaHatArray= ",doubleAlphaArray)
  cat("\n size of double array= ",length(doubleAlphaArray))
  cat("\n Duration= ",duration)
  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

}

test_that("Testing \' createNonCoverageFreqDoubleArray\'", {
  createNonCoverageFreqDoubleArrayFunction()
})
