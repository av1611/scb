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
#' tParCount = 10
#' tParArray <- createTParArray(tParCount = tParCount)
#' noise <- createNoise(sampleSize = tParCount, mean = 0, sd = 1)
#' tvMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, tParArray = tParArray)
#' sample <- createSample(model = createMa1, tvMA1CoefArray = tvMA1CoefArray, noise = noise)
#' kernel = normalDiferencekernel
#' bandwith <- 0.5
#' lag <- 2
#' nonCoverageProbability <- 0.05
#' meByCovHat <- computeMEbyCovHats(lag = lag, sample = sample, bandwith = bandwidth, nonCoverageProbability = nonCoverageProbability



computeMEbyCovHat <- function (lag,
                               sample,
                               bandwidth,
                               nonCoverageProbability)
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

  myBetaLRVHat = computeBetaLRVHat(tParArray = mytParArray,lag=lag,sample=sample,kernel = mykernel,allCorHats = mockAllCorHats)
  sampleSize = 8
  MySqrt = sqrt (-2 * log (bandwidth))
  CFactor = MySqrt  + (CK - log (log (1 / sqrt (1 - nonCoverageProbability)))) / MySqrt

  ME = CFactor * myBetaLRVHat * sqrt (PHI_K_NORMAL_DIF / (sampleSize * bandwidth))

}
