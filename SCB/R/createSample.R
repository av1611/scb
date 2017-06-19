#' @name createSample
#'
#' @aliases createX
#'
#' @description Creating \code{sample} given \code{psi}, \code{noise} and \code{model} being a function. If no model passed, \code{ma1} is used instead.
#'
#' @param model a model, which is an underlying function used to generate X vector. If model is missing, MA(1) is going to be used.
#' @param tvMA1CoefArray the psi value.
#' @param noise a white-noise vector.
#'
#' @return The vector of \code{X}
#'
#' @examples
#'
#'

createSample <- function(model = createMa1,
                         tvMA1CoefArray,
                         noise) {
  sampleSize <- length(tvMA1CoefArray)
  sample <- model(sampleSize,
                  tvMA1CoefArray,
                  noise)
}


