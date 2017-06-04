#' Create bootstrap W series using Cholesky decomposition
createBootstrapMultiplier <- function(kernel,
                                      bandwidth = 1,
                                      sampleSize
                                      ) {
  noise = createNoise(sampleSize, 0, 1)
  covar = createCovarianceByKernel(kernel, bandwidth, sampleSize)
  W = chol(covar) %*% noise
  W
}
