#' @title computeMEbyCovHat
#'
#' @name computeMEbyCovHat
#'
#' @aliases
#'
#' @description
#'
#' @param sample sample.
#' @param bootstrapReplicationCount bootstrapReplicationCount.
#'
#' @return
#'
#' @examples
#'



computeMEbyCovHat <- function (
  lag,
  sample,
  bandwidth,
  nonCoverageProbability
  )
{
  # Array rho_h(i),
  # counter i corresponds to t_i = 0, 1/n, …., 1 - 1/n,
  # horizontal ACF of a sleepers process
  lengthSleeper <- length(sleeper)
  # do we need this?
  # rhoHI <- rep(0, 10)
  CK = -1.978325
  INT_SQ_DER = 0.306951
  PHI_K_NORMAL_DIF = 0.4065


  myBetaLRVHat = computeBetaLRVHat(
    tParArray,
    lag = lag,
    sample = sample,
    kernel = normalDifferenceKernel,
    bandwidth = bandwidth
  )
  MySqrt = sqrt (- 2 * log (bandwidth))
  CFactor = MySqrt  + (CK - log (log (1/ sqrt (1 - alpha)))) / MySqrt
}

