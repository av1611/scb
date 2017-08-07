#' @title createSample
#'
#' @name createSample
#'
#' @aliases createX
#'
#' @description Creating \code{sample} given \code{tvMA1CoefArray}tvMA1CoefArray.
#'
#' @param tvMA1CoefArray the psi value.
#'
#' @return The vector of \code{X}
#'
#' @examples
#' createSample(tvMA1CoefArray = seq(from = 0, to = 1, length.out = 10))

createSample <- function(tvMA1CoefArray)
  {

  sampleSize <- length(tvMA1CoefArray)
  noise = createNoise(sampleSize, mean = 0, sd = 1)
  sample <- model(tvMA1CoefArray,
                  noise)
  }
