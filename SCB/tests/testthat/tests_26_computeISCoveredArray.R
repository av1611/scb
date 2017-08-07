computeIsCoveredArrayFunction <- function()
{
  cat("\n Testing \'computeIsCoveredArray\'\n")

  myLag = 2
  tParCount = 10

  mockTParArray <- createTParArray(tParCount = tParCount)

  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)

  mockCorArray <- computeCor(lag = myLag,
                             tvMa1CoefArray = mockTVMA1CoefArray)

  mockBandsBrick <- createBandsBrick(sampleSize = tParCount,
                                     replicationCount = tParCount)

  isCoveredArray <- computeIsCoveredArray(bandsBrick = mockBandsBrick,
                                          corArray = mockCorArray)

  cat("isCoveredArray", isCoveredArray[1, 5])
}

test_that("Testing \'isCoveredArray\'",
          computeIsCoveredArrayFunction())
