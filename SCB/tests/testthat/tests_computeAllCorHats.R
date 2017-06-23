computeAllCorHatsTestFunction = function ()

{
  sampleSize = 4
  myLength = 10
  tParArray = seq (from = , to = , length.out = myLength)
  lagCount = 3
  sample = seq (1 : sampleSize)
  kernel = normalDifferenceKernel
  bandwidth = 1

  mockCorHats = computeAllCorHats (tParArray = tParArray,
                            lagCount = lagCount,
                            sample = sample,
                            kernel = kernel,
                            bandwidth = 1)

  # expect_that(mockCorHats, is_a("numeric"))
  # expect_that(dim(mockCorHats)[1], equals(2))  # the number of rows
  # expect_that(dim(mockCorHats)[2], equals(10)) # the number of cols
}

test_that("Testing \'computeAllCorHats\' for being a matrix of 2 by N dimensions",
          computeAllCorHatsTestFunction()  )
