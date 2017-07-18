createSampleFunction <- function () {
  cat("\n Testing \'createSample\' for length and being numeric \n")
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
}



test_that("Testing \'createSample\' for length and being numeric", {
  createSampleFunction()

})
