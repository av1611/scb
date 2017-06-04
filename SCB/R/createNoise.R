#' Create \code{noise}
#'
#' @param time time, a.k.a. \code{N} of the sample of \code{X}.
#' @param mean the mean.
#' @param sd standard deviation.
#' @return The vector of numbers.
#' @examples
#' createZ(sampleSize = 10, mean = 0, sd =  1)
#' createZ(sampleSize = 20, mean = 5, sd =  10)

createNoise <- function(time,
                    mean,
                    sd) {
  noise <- rnorm(n = time,
             mean = mean,
             sd = sd)
}
