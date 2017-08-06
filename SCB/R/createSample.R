#' @title createSample
#'
#' @name createSample
#'
#' @aliases createX
#'
#' @description Creating \code{sample} given \code{tvMA1CoefArray} and \code{model} being a function.
#'
#' @param model a model, which is an underlying function used to generate a sample vector.
#' @param tvMA1CoefArray the psi value.
#'
#' @return The vector of \code{X}
#'
#' @examples
#' createSample(model = createMa1,
#'              tvMA1CoefArray = seq(from = 0,
#'                                   to = 1,
#'                                   length.out = 10),
#'              )

createSample <- function(model = createMa1,
                         tvMA1CoefArray)
{

  sampleSize <- length(tvMA1CoefArray)
  noise = createNoise(sampleSize, mean = 0, sd = 1)
  sample <- model(tvMA1CoefArray,
                  noise)
}
