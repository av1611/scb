#' Create \code{noise}
#'
#' @param time time, a.k.a. \code{N} of the sample of \code{sample}.
#' @param mean the mean.
#' @param sd standard deviation.
#' @return The vector of numbers.
#' @examples
#' createNoise(sampleSize = 10, mean = 0, sd =  1)
#' createNoise(sampleSize = 20, mean = 5, sd =  10)

createNoise <- function(time,
                    mean,
                    sd) {
  noise <- rnorm(n = time,
             mean = mean,
             sd = sd)
}
