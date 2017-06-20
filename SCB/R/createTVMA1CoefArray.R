#' @name createTVMA1CoefArray
#'
#' @aliases createPsi
#'
#' @description Creating \code{ma1CoefArray}, that is, the array of time variant coefficients, based on \code{tParArray} using a model parameter. If no model provided, \code{ma1CoefArray} vector equals to \code{tParArray} vector.
#' #'
#' @param tParArray a T parameter, a.k.a. a sleeper parameter, a sequence of numbers {0, 1}.
#' @param model a model, which is an underlying function used to generate \code{ma1CoefArray} vector.
#'
#' @return The vector of the array of time variant coefficients values corresponding to T parameter values.
#'
#' @examples
#' createMA1CoefArray(model = sin, tParArray =  seq(from = 0, to = 1, length.out = 10))
#' createMA1CoefArray(model = sin, tParArray =  seq(from = 0, to = 1, by = 0.1))

createTVMA1CoefArray <- function(model,
                      tParArray) {
  ma1CoefArray <- array(0, dim = length(tParArray))
  if (missing(model)) {
    ma1CoefArray <- tParArray
  }
  ma1CoefArray <- model(tParArray)
}
