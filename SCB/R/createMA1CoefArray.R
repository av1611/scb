#' @name createMA1CoefArray
#'
#' @aliases createpsi
#'
#' @description Creating \code{psi} based on T parameter array using a model. If no model provided, \code{psi} vector equals to \code{tpar} vector.
#'
#' @param tParArray a T parameter, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param model a model, which is an underlying function used to generate \code{psi} vector.
#'
#' @return The vector of MA1 coefficients.
#'
#' @examples
#' createMA1CoefArray (sleeper =  seq(from = 0, to = 1, length.out = 10))
#' createMA1CoefArray (sleeper =  seq(from = 0, to = 1, by = 0.1))

createPsi <- function(model,
                      tParArray) {
  ma1CoefArray <- array(0, dim = length(tParArray))
  if (missing(model)) {
    ma1CoefArray <- tParArray
  }
  ma1CoefArray <- model(tParArray)
}
