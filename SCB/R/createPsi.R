#' Create psi.
#'
#' Creating \code{psi} using a model. If no model provided, \code{psi} vector equals to \code{t} vector.
#'
#' @param sleeper a time parameter, a sequence of numbers {0, 1}.
#' @param model a model, which is an underlying function used to generate \code{psi} vector.
#' @return The vector of psi values
#' @examples
#' createPsi(sleeper =  seq(from = 0, to = 1, length.out = 10))
#' createPsi(sleeper =  seq(from = 0, to = 1, by = 0.1))
#' Before it was not uniformly
#


createPsi <- function(model,
                      sleeper) {
  psi <- array(0, dim = length(sleeper))
  if (missing(model)) {
    psi <- sleeper
  }
  psi <- model(sleeper)
}
