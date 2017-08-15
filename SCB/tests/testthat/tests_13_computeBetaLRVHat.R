computeBetaLRVHatFunction = function () {
  cat("\n Testing \'computeBetaLRVHat\' \n")
  mySampleSize=5
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)

  mockSample <- createSample(sampleSize = myTParCount)

  myLag = 3
  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = 1
 # form all rho hats
  # first try fakes
  mockAllCorHats <- computeAllCorHats(tParArray = mockTParArray,
                                    lagCount = myLagCount,
                                    sample = mockSample,
                                    kernel = myKernel,
                                    bandwidth = myBandwidth)

#  cat("mockAllCorHats[1:3, 1:3] =", mockAllCorHats[1:3, 1:3])


  mockBetaLRVHat <- computeBetaLRVHat(tParArray = mockTParArray,
                                      lag = myLag,
                                      sample = mockSample,
                                      kernel = myKernel,
                                      bandwidth = myBandwidth,
                                      allCorHats = mockAllCorHats)

  cat("mockBetaLRVHat[1:5] =", mockBetaLRVHat[1:5], "\n")
  # expect_that(betaLRVHat, is_a("matrix"))
  # expect_that(dim(betaLRVHat)[1], equals(2))  # the number of rows
  # expect_that(dim(betaLRVHat)[2], equals(10)) # the number of cols

}

test_that("Testing \'computeBetaLRVHat\'", {
  computeBetaLRVHatFunction()
  }
)



