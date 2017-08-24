computeCorTestFunction = function () {
  cat("\n Testing \'computeCor\' \n")

  myTParCount = 10
  myLag = 0
  mySampleSize=5

  mockTParArray <- createTParArray(tParCount = myTParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
  mockComputeCor <- computeCor(lag = myLag,
                               tvMa1CoefArray = mockTVMA1CoefArray)
  cat ("lag = 0; mockComputeCor[1:5] =", mockComputeCor[1:5], "\n")

  myLag = 1
  mockComputeCor <- computeCor(lag = myLag,
                               tvMa1CoefArray = mockTVMA1CoefArray)
  cat ("lag = 1; mockComputeCor[1:5] =", mockComputeCor[1:5], "\n")

  myLag = 2
  mockComputeCor <- computeCor(lag = myLag,
                               tvMa1CoefArray = mockTVMA1CoefArray)
  cat ("lag = 2; mockComputeCor[1:5] =", mockComputeCor[1:5], "\n")


  cat ("length(mockComputeCor) =", length(mockComputeCor), "\n")

  # expect_that(mockComputeCor, is_a("numeric"))
}

test_that("Testing \'computeCor\'", {
  computeCorTestFunction()
  cat(" End of test ","\n")
  cat("=====================")
  }
)
