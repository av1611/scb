#' @name createSample
#'
#' @aliases createX
#'
#' @description Creating \code{sample} given \code{tvMA1CoefArray}, \code{noise} and \code{model} being a function. If no model passed, \code{ma1} is used instead.
#'
#' @param model a model, which is an underlying function used to generate a sample vector. If model is missing, MA(1) is going to be used.
#' @param tvMA1CoefArray the psi value.
#' @param noise a white-noise vector.
#'
#' @return The vector of \code{X}
#'
#' @example
#' createSample(model = createMa1,
#'              tvMA1CoefArray = seq(from = 0,
#'                                   to = 1,
#'                                   length.out = 10),
#'              noise = rnorm(n = 10,
#'                            mean = 0,
#'                            sd = 1)))

createSample <- function(model = createMa1,
                         tvMA1CoefArray,
                         noise) {
  sampleSize <- length(tvMA1CoefArray)
  sample <- model(sampleSize,
                  tvMA1CoefArray,
                  noise)
}


