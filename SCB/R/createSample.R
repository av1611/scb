#' Create \code{sample}.
#'
#' Creating \code{sample}.
#'
#' @param model a model, which is an underlying function used to generate X vector. If model is missing, MA(1) is going to be used.
#' @param sampleSize the sample size.
#' @param psi the psi value.
#' @param noise a white-noise vector.
#' @return The vector of \code{X}
#' @examples
#'
#'

createSample <- function(model,
                    time,
                    noise,
                    psi) {
  # if(missing(model)) {
  #   X = ma1(sampleSize,
  #           psi,
  #           noise)
  # }

  sample <- model(time,
            psi,
            noise)
}
