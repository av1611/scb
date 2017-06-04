#' Generates bSampleSize bootstrap samples of length sampleSize
#' using W with given kernel
#'
bootstrapOnMA1 <- function(sourceSample, bSampleSize=10, kernel, bandwidth=1)
{
  bootstrpSamples <- array(0, c(bSampleSize, sampleSize))
  means <- rep(mean(sourceSample), sampleSize)
  centeredSample <- sourceSample - means
  for (i in 1:bSampleSize){
    currentW <- createW(kernel, bandwidth, sampleSize)
    bootstrpSamples[i, ] <- means + centeredSample * currentW
  }
  bootstrpSamples
}


