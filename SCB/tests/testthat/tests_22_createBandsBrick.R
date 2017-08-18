createBandsBrickFunction <- function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  mySampleSize=10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
  myReplicationCount=4
  myLag = 3
  myLagCount = myTParCount - 1
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

cat("\n bandsArray", bandsBrick[1:5])
}
test_that("createBandsBrick", {
  createBandsBrickFunction()
})
