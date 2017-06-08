#' Create \code{sample}.
#'
#' Creating \code{sample}.
#'
#' @param model a model, which is an underlying function used to generate X vector. If model is missing, MA(1) is going to be used.
#' @param psi the psi value.
#' @param noise a white-noise vector.
#' @return The vector of \code{X}
#' @examples
#'
#'

createSample <- function(model,
                         psi,
                         noise) {
  sampleSize <- length(psi)
  # if(missing(model)) {
  #   X = ma1(sampleSize,
  #           psi,
  #           noise)
  # }
  sample <- model(sampleSize,
            psi,
            noise)
}
