#' Generate covariance function by given kernel

# kernel - symmetric positive-defined function;
# bandwidth is the same as window width in kernel smoothing - accounts dependency in resulting bootstrap

createCovarByKernel <- function(kernel, bandwidth=1, sampleSize)
{
  covar = diag(kernel(0), sampleSize) # diagonal elements are equal as variances
  for (i in 1:sampleSize-1) # simultaneous upper- & lower-triangular assignment
  {
    for (j in (i+1):sampleSize)
    {
      current_element = kernel((j-i)/bandwidth) # temporarily save for multiple assignment
      covar[i,j] = current_element
      covar[j,i] = current_element
    }
  }
  covar
}
