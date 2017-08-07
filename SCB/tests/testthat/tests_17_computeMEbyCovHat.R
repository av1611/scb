computeMEbyCovHatFunction <- function () {
  cat("\n Testing \'computeMEbyCovHat\' \n")
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)

  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,
                                         tParArray = mockTParArray)

  mockSample <- createSample(model = createTVMA1,
                             tvMA1CoefArray = mockTVMA1Array)
  ME=computeMEbyCovHat(lag=2,sample = mockSample,bandwidth = 0.5,
                       nonCoverageProbability = 0.05)
  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
cat("ME",ME)
}

test_that("Testing \'computeMEbyCovHat\'", {
  computeMEbyCovHatFunction()
}
)
