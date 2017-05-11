#' Create vector of X.
#'
#' Intended to be run as an underlying function from within \code{createX}. Thus, supposed to be passed as the value of \code{model} option of \code{createX} function
#'
#' @param model a model, which is an underlying function used to generate X vector. If model is missing, MA(1) is going to be used.
#' @param sampleSize the sample size.
#' @param psi the psi value.
#' @param Z a white-noise vector.
#' @return The vector of \code{X}
#' @examples
#'
#'

createX <- function(model,
                    time,
                    Z,
                    psi) {
  # if(missing(model)) {
  #   X = ma1(sampleSize,
  #           psi,
  #           Z)
  # }

  X = model(time,
            psi,
            Z)
  X
}
