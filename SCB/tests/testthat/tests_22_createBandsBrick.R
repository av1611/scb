createBandsBrickFunction <- function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  mySampleSize=40
  myTParCount = 2
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
  myReplicationCount=5
  myLag = 1
  myLagCount = 4
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

cat("bandsArray", bandsBrick[1:5])
}
test_that("createBandsBrick", {
  createBandsBrickFunction()
  cat(" End of test createBandsBrick","\n")
  cat("=====================")
})
