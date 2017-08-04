computeNonCoverageFreqByCorHatsfunction=function()
{
  cat ("\n Testing \'computeNonCoverageFreqByCorHats\'\n")
  myLag=2
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockNoise <- createNoise(sampleSize = tParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(sampleSize = tParCount,
                           tvMA1CoefArray = mockTVMA1CoeffArray,
                           noise = mockNoise)
  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(sampleSize = tParCount,
                           tvMA1CoefArray = mockTVMA1CoeffArray,
                           noise = mockNoise)
  Cor=computeCor(lag=myLag,tvMa1CoefArray = mockTVMA1)
  mySample=createSample(model = mockTVMA1,
  tvMA1CoefArray = seq(from = 0,to = 1,length.out = 10),noise = rnorm(n = 10,mean = 0,
                              sd = 1))
BandsArrray=createBandsArray(replicationCount = 10,sample = mySample,
                             corArray = Cor,bandwidth = 1 ,
                             nonCoverageProbability = 0.05)
NonCov=computeNonCoverageFreqByCorBands(bandsArray = BandsArrray,
                                        corArray = Cor)
cat("NonCoverageFreqByCorBands:",NonCov,"\n")

}
test_that("computeNonCoverageFreqByCorHats", {
  computeNonCoverageFreqByCorHatsfunction()
}
)
