#' Computing all rho hats, that ls, computing correlations hat.
#'
#' @param sleeper sleeper.
#' @param lagCount lagCount
#' @param sample sample.
#' @param kernel kernel.
#' @param bandwidth bandwidth.
#'
#' @return Double array of sizes sleeperCount and lagCount
#'
#' @examples

computeAllRhoHats <- function(sleeper,
                              lagCount,
                              sample,
                              kernel,
                              bandwidth) {
  # Array rho_h(i),
  # counter i corresponds to t_i = 0, 1/n, …., 1 - 1/n,
  # horizontal ACF of a sleepers process
  lengthSleeper <- length(sleeper)
  rhoHI <- rep(0, 10)
}

