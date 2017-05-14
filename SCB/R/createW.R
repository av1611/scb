#' Create bootstrap W series using Cholesky decomposition
createW <- function(kernel, bandwidth=1, sampleSize){
  noise = createZ(sampleSize,0,1)
  covar = createKernelCovar(kernel, bandwidth, sampleSize)
  W = chol(covar) %*% noise
  W
}
