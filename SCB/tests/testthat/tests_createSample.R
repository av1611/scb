test_that("Testing createSample for length and being numeric", {
  mockTParArray <- createTParArray(tParCount = 10)
  mockNoise <- createNoise(sampleSize = 10,
                           mean = 0,
                           sd = 1)
  mockTVMA1Array <- createTVMA1Array(model = sin,
                                     tParArray = mockTParArray)
  mockSample <- createSample(model = createMa1,
                             tvMA1CoefArray,
                             noise)
  expect_that(mockSample, is_a("array"))
  expect_that(length(mockSample), equals(10))
})
