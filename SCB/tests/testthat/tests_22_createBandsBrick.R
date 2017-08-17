createBandsBrickFunction <- function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  myLag <- 2
  myTParCount <- 3
  myReplicationCount <- 4
  mySampleSize = 5
  myLagCount = myTParCount - 1
  myBandwidth = 0.5
  nonCoverageProbability = 0.05
  mySample = createSample(sampleSize = mySampleSize)
  mockTParArray <- createTParArray(tParCount = myTParCount)

mockSample <- createSample(sampleSize = mySampleSize)
mockSampleSize = length(mockSample)

bandsBrick=createBandsBrick(tParArray=mockTParArray,
                            lag=myLag,
                            lagCount=0,
                            bandwidth= myBandwidth,
                            kernel = normalDifferenceKernel,
                            sampleSize=mySampleSize,
                            nonCoverageProbability = nonCoverageProbability,
                            replicationCount=myReplicationCount)

cat("bandsArray", mockBandsBrick[1:5])
}
test_that("createBandsBrick", {
  createBandsBrickFunction()
})
