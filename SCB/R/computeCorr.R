#' @name computeCorr
#'
#' @aliases createRho
#'
#' @description Computing correlation: \code{rho} given \code{model} as being a function, \code{lag} and \code{tpar}
#'
#' @param model the model (fixed MA1).
#' @param lag the lag
#' @param tParArray the sleeper
#'
#' @return Array \code{rho_h(i)}, counter \code{i} corresponds to \code{ t_i = 0, 1/n, …., 1 - 1/n }, horizontal ACF of a sleepers process

#'
#' @examples
#' createRho(model = ma1, lag = 1, sleeper = seq(0, 1, 0.1)

computeCorr <- function(model,
                      lag,
                      computeCorr) {
  # Array rho_h(i),
  # counter i corresponds to t_i = 0, 1/n, …., 1 - 1/n,
  # horizontal ACF of a sleepers process
  lengthSleeper <- length(sleeper)
  rhoHI <- rep(0, 10)
}
