computeAllCorHatsTestFunction = function () {
  cat("\n Testing \'computeAllCorHats\' \n")
  mySampleSize=5
  myTParCount = 10
  mockTParArray <- createTParArray(tParCount = myTParCount)
  # may be different
  mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)

  mockSample <- createSample(sampleSize = mySampleSize)

  myLag = 3
  myLagCount = myTParCount - 1
  myKernel = normalDifferenceKernel
  myBandwidth = 1
  # form all rho hats
  # first try fakes
  mockAllCorHats <- computeAllCorHats(tParArray = mockTParArray,
                                      lagCount = myLagCount,
                                      sample = mockSample,
                                      kernel = myKernel,
                                      bandwidth = myBandwidth)

  # print the first 9 elements. Hope, sizes are greater than 3.
  cat("str(mockAllCorHats) = ", str(mockAllCorHats), "\n")
  lag = 1
  mockCorHatsSecCol <- eval(parse(text = paste0("mockAllCorHats$`", lag, "`")))
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


