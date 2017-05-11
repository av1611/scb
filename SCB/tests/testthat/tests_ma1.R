test_that("Testing ma1 for length and being numeric", {
  mockT <- createT(lengthT = 10)
  mockZ <- mockZ <- createZ(sampleSize = 10,
                            mean = 0,
                            sd = 1)
  mockPsi <- createPsi(model = sin,
                       t = mockT)
  mockMa1 <- ma1(sampleSize = 10,
                 psi = mockPsi,
                 Z = mockZ
                 )
  expect_that(mockMa1, is_a("array"))
  expect_that(length(mockMa1), equals(10))
  }
)
