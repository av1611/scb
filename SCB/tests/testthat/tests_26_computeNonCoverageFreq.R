computeNonCoverageFreqByCorHatsfunction=function()
{
  cat ("\n Testing \'computeNonCoverageFreqByCorHats\'\n")
  myLag=2
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockNoise <- createNoise(sampleSize = myTParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array,
                             noise = mockNoise)


 cat ("mockSample[1:5] =", mockSample[1:5], "\n")
  expect_that(mockSample, is_a("array"))

  Cor=computeCor(lag=myLag,tvMa1CoefArray = mockTVMA1Array)
mySampleSize=length(mockSample)
cat("sampleSize:",mySampleSize,"\n")

BandsArrray=createBandsBrick(replicationCount = 10,sampleSize = mySampleSize,tParArray = mockTParArray)
NonCov=computeNonCoverageFreqByCorBands(bandsArray = BandsArrray,
                                       corArray = Cor)
at("NonCoverageFreqByCorBands:",NonCov,"\n")

}
test_that("computeNonCoverageFreqByCorHats", {
  computeNonCoverageFreqByCorHatsfunction()
}
)
