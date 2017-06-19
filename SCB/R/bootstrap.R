#' @name createBootstrapSamples
#'
#' @aliases bootstrap
#'
#' @description Run a bootstrap on X vector.
#'
#' @param sample sample.
#' @param bootstrapReplicationCount bootstrap replication count.
#'
#' @return A two dimensional vector representing the lower and the upper bound of CI.
#' @examples
#' createBootstrapSamples(X = rnorm(n = 10, mean = 0, sd = 1), alpha = 0.05))
#' createBootstrapSamples(X = rnorm(n = 20, mean = 5, sd = 10), alpha = 0.15))

createBootstrapSamples <- function(sample,
                                   bootstrapReplicationCount) {

}

