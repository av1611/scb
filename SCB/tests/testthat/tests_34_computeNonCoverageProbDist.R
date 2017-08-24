computeNonCoverageProbDistFunction <- function () {
  cat("\n Testing \'computeNonCoverageProbDist\' \n")

  # expect_that(mockBand, is_a("matrix"))
  # expect_that(dim(mockBand)[1], equals(2))  # the number of rows
  # expect_that(dim(mockBand)[2], equals(10)) # the number of cols
  superReplicationCoun = 5
  replicationCoun = 4
  nonCoverageProbability = 0.05
  mySampleSize = 10
  NonCoverageDist = computeNonCoverageProbDist(
    superReplicationCount = superReplicationCoun,
    sampleSize = mySampleSize,
    replicationCount = replicationCoun,
    nonCoverageProbability = nonCoverageProbability
  )
  cat("\n NonCoverageDist",NonCoverageDist)
}

test_that("Testing \'computeNonCoverageProbDist\'", {
  computeNonCoverageProbDistFunction()
  cat(" End of test ","\n")
  cat("=====================")
})
