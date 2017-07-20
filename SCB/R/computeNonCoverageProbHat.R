#' @name computeNonCoverageProbDist
#'
#' @aliases
#'
#' @description
#'
#' @param sampleSize sampleSize
#' @param replicationCount replicationCount
#' @param nonCoverageProbability nonCoverageProbability

#' @return
#'
#' @example
#'


computeNonCoverageProbHat  <- function(sampleSize,
                                              replicationCount,
                                              nonCoverageProbability) {
  # What it does
  # Takes a model.
  # For this model it calculates the rho
  # Creates many samples
  # For each sample it creates a band
  # Creates an array of zeros and ones (1 if a true rho is covered by a band)
  # Calculates alpha hat or
  # nonCoverageProbabilityHat = number of zeros / superReplication
  # nonCoverageProbabilityHat <-
}
