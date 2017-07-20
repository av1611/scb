#' @name computeAllCorHats
#'
#' @aliases computeAllRhoHats
#'
#' @description Computing correlations hat, that is, all rho hats.
#'
#' @param tParArray a T parameter array, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param lagCount lag.
#' @param sample sample.
#' @param kernel kernel.
#' @param bandwidth bandwidth.
#'
#' @return
#'
#' @example
#'

computeAllCorHats <- function(tParArray,
                              lagCount,
                              sample,
                              kernel,
                              bandwidth = 1) {
  # Double array of sizes sleeperCount and lagCount
  # Inner counter -  tPar
  # Outer counter - lag
  tParCount <- length(tParArray)
  allCorHats <- array(0, dim = c(tParCount, lagCount + 1))
  colNamesForAllCorHats <- as.character(c(0, seq_len(lagCount)))
  colnames(allCorHats) <- colNamesForAllCorHats
  allCorHats <- as.data.frame(allCorHats)
  allCorHats$`0` <- 1 # replicating 1
  # each tPar element is being called by its index,
  # each lag element is being called as it is
  # (index of each lag is the lag itself)
  for (lagIndex in 0:lagCount) {
    for (tParIndex in seq_len(tParCount)) {
      tParPoint = tParArray[tParIndex]

      # lagIndexToRefer <- eval(parse(text = paste0("allCorHats$`", lagIndex + 1, "`")))
      allCorHats[tParIndex, lagIndex + 1] <- computeCorHat(tParArray = tParPoint,
                                                       lag = lagIndex,
                                                       sample = sample,
                                                       kernel = kernel,
                                                       bandwidth = bandwidth)
    }
  }

  allCorHats
  # computeAllCorHats returns one-dimensional array, whereas it should return two-dimensional
}
