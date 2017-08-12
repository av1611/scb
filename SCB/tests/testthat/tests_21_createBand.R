createBandFunction <- function()
{
  cat("\n Testing \'createBand\' \n ")
  lag=0

  tParCount = 10
  tParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = tParArray)
  mySample <- createSample(tvMA1CoefArray = mockTVMA1CoefArray)


  myLagCount = tParCount - 1
  kernel = normalDifferenceKernel
  bandwidth = 1
  mockCorHats = computeAllCorHats(tParArray = tParArray,
                                  lagCount = myLagCount,
                                  sample = mySample,
                                  kernel = kernel,
                                  bandwidth = 0.5)
  mockBand <- createBand(tParArray =tParArray,
                         lag = lag,
                         lagCount =myLagCount,
                         bandwidth = 0.5,
                         kernel = normalDifferenceKernel,
                         nonCoverageProbability = 0.05,
                         allCorHats = mockCorHats)




  # # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
}

test_that("Testing \'createBand\'",
          createBandFunction())

