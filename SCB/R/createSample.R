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

<<<<<<< HEAD:SCB/R/createX.R
createX <- function(model,
                    sampleSize,
                    Z,
=======
createSample <- function(model,
                    time,
                    noise,
>>>>>>> 4bfb282544601b59851f24cef9e00599c5b92b58:SCB/R/createSample.R
                    psi) {
  # if(missing(model)) {
  #   X = ma1(sampleSize,
  #           psi,
  #           noise)
  # }

<<<<<<< HEAD:SCB/R/createX.R
  X = model(sampleSize,
=======
  sample <- model(time,
>>>>>>> 4bfb282544601b59851f24cef9e00599c5b92b58:SCB/R/createSample.R
            psi,
            noise)
}
