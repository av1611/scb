computeNonCoverageFreqFunction <- function()
{
  cat ("\n Testing \'computeNonCoverageFreq\'\n")
  myLag = 2
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockSample <- createSample(tvMA1CoefArray = mockTVMA1Array)

  trueCorrelationArray = computeCor(lag = myLag, tvMa1CoefArray = mockTVMA1Array)
  mySampleSize = length(mockSample)
  cat("sampleSize:", mySampleSize, "\n")

  bandsArrray = createBandsBrick(replicationCount = 10,
                                 sampleSize = mySampleSize,
                                 tParArray = mockTParArray)

  nonCoverageFreq = computeNonCoverageFreq(sampleSize = mySampleSize,
                                           tParArray = mockTParArray,
                                           corArray = trueCorrelationArray)

  cat("NonCoverageFreqByCorBands:", nonCoverageFreq, "\n")

}
test_that("computeNonCoverageFreqByCorHats", {
  computeNonCoverageFreqFunction()
})
