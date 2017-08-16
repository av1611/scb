createBandsBrickFunction <- function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  myLag <- 2
  myTParCount <- 3
  myReplicationCount <- 4
  mySampleSize = 5
  myBandwidth = 0.5
  nonCoverageProbability = 0.05
  mySample=createSample(sampleSize = mySampleSize)
  mockTParArray <- createTParArray(tParCount = myTParCount)
mockAllCorHats=computeAllCorHats(tParArray = mockTParArray,)
  mockSample <- createSample(sampleSize = mySampleSize)
  mockSampleSize = length(mockSample)
mockAllCorHats=computeAllCorHats(t)
bandsBrick=createBandsBrick(tParArray=mockTParArray,
                            lag=myLag,
                            lagCount=lagCount,
                            bandwidth= myBandwidth,
                            kernel = normalDifferenceKernel,
                            sampleSize=mySampleSize,
                            nonCoverageProbability = nonCoverageProbability,
                            replicationCount=myReplicationCount,
                            allCorHats)

  cat("bandsArray", mockBandsBrick[1:5])
}
test_that("createBandsBrick", {
  createBandsBrickFunction()
})
