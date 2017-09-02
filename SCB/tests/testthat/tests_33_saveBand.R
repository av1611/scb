saveBandFuction <- function()
{
  cat ("\n Testing \'SaveBand\'\n")

  mySampleSize=10
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  myLag = 1
  myLagCount = 4
  myKernel = normalDifferenceKernel
  myBandwidth = 0.5
  myNonCoverageProbability=0.05

  corArray <- computeCor(lag = myLag, coefFunction = sin, tParArray = mockTParArray)

  band <- createBand(
    tParArray = mockTParArray,
    lag = myLag,
    lagCount = myLagCount,
    bandwidth = myBandwidth,
    kernel = myKernel,
    sampleSize = mySampleSize,
    nonCoverageProbability = myNonCoverageProbability )
  fileName <- paste("ss", mySampleSize, "l", myLag, "tPar", length(mockTParArray), "alpha"
                    , myNonCoverageProbability, sep = "_")
  saveBand(band = band, corArray = corArray, fileName = fileName)
}

test_that("Testing saveBand",
  {
  saveBandFuction()
  cat(" End of test saveBand","\n")
  cat("=====================")
  })

