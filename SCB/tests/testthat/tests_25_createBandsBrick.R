createBandsBrickfunction=function()
{
  cat ("\n Testing \'createBandsBrick\'\n")
  myLag=2
  myTParCount = 10
  replicationCount=10
  BandsBrick=createBandsBrick(replicationCount = 10,bandwidth = 0.5,nonCoverageProbability = 0.05)
 cat("BAndsBrick",BandsBrick)
}
test_that("createBandsBrick", {
  createBandsBrickfunction()
}
)
