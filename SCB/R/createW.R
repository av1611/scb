#' Create bootstrap W series using Cholesky decomposition of given covariance matrix
#'
createW <- function(kernel, bandwidth=1, sampleSize){
  noise = createZ(sampleSize, mean=0, sd=1) # generates underlying white noise
  covar = createCovarByKernel(kernel, bandwidth, sampleSize) # generates given covariance matrix
  W = chol(covar) %*% noise # linearly transforms white noise in Gaussian vector ~ N(0, covar)
  W
}
