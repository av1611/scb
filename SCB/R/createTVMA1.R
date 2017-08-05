#' @title createTVMA1
#'
#' @name createTVMA1
#'
#' @aliases ma1
#'
#' @description A manual implementation of MA1 algo.
#'
#' Intended to be run as an underlying function from within \code{createX}.
#' Thus, supposed to be passed as the value of \code{model} option of \code{createX} function
#'
#' @param sampleSize the sample size.
#' @param tvMA1CoefArray the \code{MA1 coefficents array}.
#' @param noise a white-noise vector.
#'
#' @return The vector of \code{X}
#'
#' @examples
#' tParCount = 10
#' tParArray <- createTParArray(tParCount = tParCount)
#' noise <- createNoise(sampleSize = tParCount, mean = 0, sd = 1)
#' tvMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin, tParArray = tParArray)
#' tvMA1 <- createTVMA1(sampleSize = tParCount, tvMA1CoefArray = tvMA1CoeffArray, noise = noise)

createTVMA1 <- function(
                      tvMA1CoefArray,
                      noise)
{
  # we may have one off problem here
  sampleSize = length (noise)
  mySample = array(0, dim = sampleSize)
  mySample [1] <- noise[1]

  for (i in 2:sampleSize)
  {
    mySample [i] <- noise[i] + tvMA1CoefArray[i] * noise[i - 1]
  }

  mySample
}
