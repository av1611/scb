test_that("Testing createT for length and being numeric", {
  mockT <- createT(lengthT = 10)
  expect_that(mockT, is_a("numeric"))
  expect_that(length(mockT), equals(10))
  }
)
