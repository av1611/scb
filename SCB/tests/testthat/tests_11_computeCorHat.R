computeCorHatFunction = function () {
  cat("\n Testing \'computeCorHat\' \n")

  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockNoise <- createNoise(sampleSize = 10,
                           mean = 0,
                           sd = 1)
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)
  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array,
                             noise = mockNoise)

  myLag = 2
  myKernel = normalDifferenceKernel
  myBandwidth = 1

  mockCorHat <- computeCorHat(tParArray = mockTParArray,
                              lag = myLag,
                              sample = mockSample,
                              kernel = myKernel,
                              bandwidth = myBandwidth)

  cat("mockCorHat[1:5] = ", mockCorHat[1:5], "\n")
  cat ("length(mockCorHat) = ", length(mockCorHat), "\n")
  expect_that(mockCorHat, is_a("numeric"))

  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

}

test_that("Testing \'computeCorHat\'", {
  computeCorHatFunction()

}

)
