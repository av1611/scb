test_that("Testing createSample for length and being numeric", {
  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  # may be different
  mockNoise <- createNoise(sampleSize = tParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1Array <- createTVMA1Array(model = sin,
                                     tParArray = mockTParArray)
  mockSample <- createSample(model = createMa1,
                             tvMA1CoefArray,
                             noise)
  expect_that(mockSample, is_a("array"))
  expect_that(length(mockSample), equals(tParCount))
})
