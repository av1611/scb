#' @name computeCorHat
#'
#' @aliases computeRhoHat
#'
#' @description Computing a ratio of \code{correlation hat} given certain \code{lag} over \code{correlation hat} of \code{lag = 0}.
#'
#'
#' @param tParArray a T parameter, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param lag a lag value.
#' @param sample a sample.
#' @param kernel a kernel function.
#' @param bandwidth by default, bandwidth = 1.
#'
#'
#' @return A scalar value of a ratio of \code{correlation hat} given certain \code{lag} over \code{correlation hat} of \code{lag = 0}
#'
#' @examples
#'


computeCorHat <- function(tParArray,
                          lag,
                          sample,
                          kernel,
                          bandwidth = 1,
                          ...)
{
  numerator = computeCovHat (tParArray,
                               lag = lag,
                               sample,
                               kernel,
                               bandwidth)
  denominator = computeCovHat (tParArray,
                                lag = 0,
                                sample,
                                kernel,
                                bandwidth)

  corHat = numerator / denominator

}
