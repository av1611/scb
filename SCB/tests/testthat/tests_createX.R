test_that("Testing createX for length and being numeric", {
  mockT <- createT(lengthT = 10)
  mockZ <- mockZ <- createZ(sampleSize = 10,
                            mean = 0,
                            sd = 1)
  mockPsi <- createPsi(model = sin,
                       t = mockT)
  mockX <- createX(model = ma1,
                   sampleSize = 10,
                   Z = mockZ,
                   psi = mockPsi)
  expect_that(mockX, is_a("array"))
  expect_that(length(mockX), equals(10))
})
