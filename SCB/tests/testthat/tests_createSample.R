test_that("Testing createSample for length and being numeric", {
  mockSleeper <- createSleeper(number_steps = 10)
  mockNoise <- createNoise(sampleSize = 10,
                            mean = 0,
                            sd = 1)
  mockPsi <- createPsi(model = sin,
                       sleeper = mockSleeper)
  mockSample <- createSample(model = ma1,
                             psi = mockPsi,
                             noise = mockNoise)
  expect_that(mockSample, is_a("array"))
  expect_that(length(mockSample), equals(10))
})
