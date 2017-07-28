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



computeMEbyCovHat <- function (lag,
                               sample,
                               bandwidth,
                               alpha)
{
  # Array rho_h(i),
  # counter i corresponds to t_i = 0, 1/n, …., 1 - 1/n,
  # horizontal ACF of a sleepers process
  #lengthSleeper <- length(sleeper)
  # do we need this?
  # rhoHI <- rep(0, 10)
  CK = -1.978325
  INT_SQ_DER = 0.306951
  PHI_K_NORMAL_DIF = 0.4065
  # mylag=2
  tParCount = 10
  mytParArray = createTParArray(tParCount)
  mykernel = normalDifferenceKernel
  myLagCount = tParCount - 1

  mockAllCorHats <- computeAllCorHats(tParArray = mytParArray,
                                      lagCount = myLagCount,
                                      sample = sample,
                                      kernel = mykernel,
                                      bandwidth = bandwidth)
 cat("mockAllCorHats",str(mockAllCorHats),"\n")

  myBetaLRVHat = computeBetaLRVHat(tParArray = mytParArray,lag=lag,sample=sample,kernel = mykernel,allCorHats = mockAllCorHats)
  cat("myBetaLRVHat",myBetaLRVHat, "\n")
  sampleSize = 8
  cat("bandwidth",bandwidth)
  MySqrt = sqrt (-2 * log (bandwidth))
  cat("mySqrt",MySqrt,"\n")
  CFactor = MySqrt  + (CK - log (log (1 / sqrt (1 - alpha)))) / MySqrt

  ME = CFactor * myBetaLRVHat * sqrt (PHI_K_NORMAL_DIF / (sampleSize * bandwidth))

}
