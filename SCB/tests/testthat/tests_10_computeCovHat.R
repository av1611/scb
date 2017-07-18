computeCovHatFunction = function () {
  cat("\n Testing \'computeCovHat\' \n")
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockNoise <- createNoise(sampleSize = tParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array,
                             noise = mockNoise)

  myLag = 1
  myKernel = normalDifferenceKernel
  myBandwidth = 1

  mockCovHat <- computeCovHat(tParArray = mockTParArray,
                              lag = myLag,
                              sample = mockSample,
                              kernel = myKernel,
                              bandwidth = myBandwidth)
  cat ("mockCovHat[1:5] = ", mockCovHat[1:5], "\n")
  cat ("length(mockCovHat) = ", length(mockCovHat), "\n")
  expect_that(mockCovHat, is_a("numeric"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

}

test_that("Testing \'computeCovHat\'", {
  computeCovHatFunction()

}

)
