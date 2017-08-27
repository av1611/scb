computeIsCoveredArrayFunction <- function()
{
  cat("\n Testing \'computeIsCoveredArray\'\n")

  mySampleSize=10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
  myReplicationCount=5
  myLag = 2
  myLagCount = 3
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability=0.05


  bandsBrick=createBandsBrick(tParArray=mockTParArray,
                              lag=myLag,
                              lagCount=myLagCount,
                              bandwidth= myBandwidth,
                              kernel = normalDifferenceKernel,
                              sampleSize=mySampleSize,
                              nonCoverageProbability = myNonCoverageProbability,
                              replicationCount=myReplicationCount)
  mockCorArray <- computeCor(lag = myLag,
                             tvMa1CoefArray = mockTVMA1Array)



      isCoveredArray <-
        computeIsCoveredArray(bandsBrick = bandsBrick,
                              corArray = mockCorArray)

      cat("\nisCoveredArray:", isCoveredArray, "\n")
}

test_that("Testing \'isCoveredArray\'", {
  computeIsCoveredArrayFunction()
  cat(" End of test isCoveredArray","\n")
  cat("=====================")
})

