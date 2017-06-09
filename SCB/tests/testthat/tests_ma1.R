test_that("Testing ma1 for length and being numeric", {
  mockSleeper <- createSleeper(number_steps = 10)
  mockNoise <- createNoise(sampleSize = 10,
                            mean = 0,
                            sd = 1)
  mockPsi <- createPsi(model = sin,
                       sleeper = mockSleeper)
  mockMa1 <- ma1(sampleSize = 10,
                 psi = mockPsi,
                 noise = mockNoise)
  expect_that(mockMa1, is_a("array"))
  expect_that(length(mockMa1), equals(10))
  }
)
