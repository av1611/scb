computeAllCorHatsTestFunction = function () {
  cat("\n Testing \'computeAllCorHats\' \n")

  tParCount = 10
  mockTParArray <- createTParArray(tParCount = tParCount)
  mockTVMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin,
                                             tParArray = mockTParArray)
  mockSample <- createSample(tvMA1CoefArray = mockTVMA1CoefArray)


  myLagCount = tParCount - 1
  kernel = normalDifferenceKernel
  bandwidth = 1

  # this should return double array
  # lag is the first dimension
  # t or tPar is the second dimension
  mockCorHats = computeAllCorHats(tParArray = mockTParArray,
                                  lagCount = myLagCount,
                                  sample = mockSample,
                                  kernel = kernel,
                                  bandwidth = 1)


  # print the first 9 elements. Hope, sizes are greater than 3.
  cat("str(mockCorHats) = ", str(mockCorHats), "\n")
  lag = 1
  mockCorHatsSecCol <- eval(parse(text = paste0("mockCorHats$`", lag, "`")))
  cat("The second col of mockCorHats = ", mockCorHatsSecCol, "\n")
  # same but by steps does not work
  # colRefName = paste0("mockCorHats$`", lag, "`")
  # parsedColRefName = parse (text = colRefName)
  # evaluatedColumn = eval (parsedColRefName)
  #
  # cat("colRefName = ", colRefName, "\n")
  # cat("parsedColRefName = ", parsedColRefName, "\n")
  # cat("evaluatedColumn = ", evaluatedColumn, "\n")


  cat("The second col of mockCorHats = ", mockCorHatsSecCol, "\n")
}

test_that("Testing \'computeAllCorHats\'",
          computeAllCorHatsTestFunction()  )
# lagIndexToRefer <- eval(parse(text = paste0("allCorHats$`", lagIndex + 1, "`")))


