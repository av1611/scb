test_that("Testing createPsi for length and being numeric", {
  mockT <- createT(lengthT = 10)
  mockPsi <- createPsi(model = sin,
                       t = mockT)
  expect_that(mockPsi, is_a("numeric"))
  expect_that(length(mockPsi), equals(10))
  }
)
