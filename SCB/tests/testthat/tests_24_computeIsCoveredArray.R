computeIsCoveredArrayFunction <- function()
{
  cat("\n Testing \'computeIsCoveredArray\'\n")

  mySampleSize=5
  myTParCount = 5
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
  myReplicationCount=2
  myLag = 1
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
  mockCorArray <- computeCor(lag = myLag,coefFunction = sin,tParArray = mockTParArray)



      isCoveredArray <-
        computeIsCoveredArray(bandsBrick = bandsBrick,
                              corArray = mockCorArray)


      # expect(5 == 5)
      cat("\n isCoveredArray: ", isCoveredArray, "\n")
      cat("\n lenfth of isCoveredArray: ", length(isCoveredArray), "\n")
      cat("\n myReplicationCount: ", myReplicationCount, "\n")
      cat("\n should be eaual \n")



}

test_that("Testing \'isCoveredArray\'", {
  computeIsCoveredArrayFunction()
  cat(" End of test isCoveredArray","\n")
  cat("=====================")
})

