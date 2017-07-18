computeCorTestFunction = function () {
  cat("\n Testing \'computeCor\' \n")

  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  myLag = 1
  myModel = createTVMA1

  mockComputeCor <- computeCor(tParArray = mockTParArray,
                               lag = myLag,
                               model = myModel)

  cat ("mockComputeCor[1:5] =", mockComputeCor[1:5], "\n")
  cat ("length(mockComputeCor) =", length(mockComputeCor), "\n")
  expect_that(mockComputeCor, is_a("numeric"))
  # expect_that(mockComputeCor, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols

}


test_that("Testing \'computeCor\'", {
  computeCorTestFunction()

  }

)
