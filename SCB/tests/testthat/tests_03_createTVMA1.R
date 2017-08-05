createTVMA1Function <- function()
{
  cat("\n Testing \'createTVMA1\' for length and being numeric \n")

  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockNoise <- createNoise(sampleSize = tParCount,
                           mean = 0,
                           sd = 1)
  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(tvMA1CoefArray = mockTVMA1CoeffArray,
                           noise = mockNoise)

  cat ("mockTVMA1[1:5] =", mockTVMA1[1:5], "\n")
  expect_that(mockTVMA1, is_a("array"))
}


test_that("Testing createTVMA1",
  {
  createTVMA1Function()
  }
)
