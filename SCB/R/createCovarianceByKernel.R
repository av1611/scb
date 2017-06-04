#' Generate covariance function given kernel
createCovarianceByKernel <- function(kernel,
                                     bandwidth = 1,
                                     sampleSize
                                     ) {
  covar = diag(kernel(0/bandwidth)/2, sampleSize)
  for (i in 1:sampleSize - 1) {
    for (j in (i + 1):sampleSize){
      covar[i, j] = kernel(abs(j - i)/bandwidth)
    }
  }
  covar = covar + t(covar)
  covar
}
