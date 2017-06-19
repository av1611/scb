test_that("Testing createPsi for length and being numeric", {
  mockSleeper <- createSleeper(number_steps = 10)
  mockPsi <- createPsi(model = sin,
                       sleeper = mockSleeper)
  expect_that(mockPsi, is_a("numeric"))
  expect_that(length(mockPsi), equals(10))
  }
)
