#' @title computeCorHat
#'
#' @name computeCorHat
#'
#' @aliases computeRhoHat
#'
#' @description Computing a ratio of \code{correlation hat} given certain \code{lag} over \code{correlation hat} of \code{lag = 0}.
#'
#' @param tParArray a T parameter, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param lag a lag value.
#' @param sample a sample.
#' @param kernel a kernel function.
#' @param bandwidth by default, bandwidth = 1.
#'
#' @return A scalar value of a ratio of \code{correlation hat} given certain \code{lag} over \code{correlation hat} of \code{lag = 0}
#'
#' @examples
#'tParArray <- createTParArray(tParCount = tParCount)
#'createSample(model = createMa1,tvMA1CoefArray = seq(from = 0,to = 1,length.out = 10),noise = rnorm(n = 10,mean = 0,sd = 1)))
#'kernel=normalDiferencekernel
#'lag=2
#'bandwith=1
#'CorHat=computeCorHat(tParArray=tParArray,lag=lag,sample=sample,kernel=kernel,bandwidth=1)


computeCorHat <- function(tParArray,
                          lag,
                          sample,
                          kernel,
                          bandwidth = 1)
{
  numerator = computeCovHat(tParArray,
                               lag = lag,
                               sample,
                               kernel,
                               bandwidth)
  denominator = computeCovHat (tParArray,
                                lag = 1,
                                sample,
                                kernel,
                                bandwidth)

  corHat = numerator / denominator

}
