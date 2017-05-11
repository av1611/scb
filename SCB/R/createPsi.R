#' Create psi.
#'
#' Creating \code{psi} using a model. If no model provided, \code{psi} vector equals to \code{t} vector.
#'
#' @param t a time parameter, a sequence of numbers {0, 1}.
#' @param model a model, which is an underlying function used to generate \code{psi} vector.
#' @return The vector of psi values
#' @examples
#' createPsi(t =  seq(from = 0, to = 1, length.out = 10))
#' createPsi(t =  seq(from = 0, to = 1, by = 0.1))
#' Before it was not uniformly
# 


createPsi <- function(model,
                      t) {
  psi <- array(0, dim = length(t))
  if (missing(model)) {
    psi <- t
  }
  psi <- model(t)
}
