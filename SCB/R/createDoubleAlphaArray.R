createDoubleAlphaArray = function(alphaCount,
                                  superReplicationCount,
                                  replicationCount,
                                  sampleSize,
                                  lag,
                                  lagCount,
                                  tParArray,
                                  kernel = normalDifferenceKernel,
                                  bandwidth,
                                  nonCoverageProbability)

{
  doubleAlphaArra = array(0, dim = c(alphaCount, superReplicationCount))
  alphaArray=array(0,dim =alphaCount)
  alphaArray <- seq(from = 0.05,
                   to   = 1 - 1 / alphaCount,
                   by   = 1 / alphaCount)
  cat("\nalphaArray= ",alphaArray[1])
  for (alphaIndex in 1: alphaCount)
{
    n=alphaArray[alphaIndex]
    doubleAlphaArra[alphaIndex, ] = computeNonCoverageFreqArray(
      superReplicationCount = superReplicationCount,
      replicationCount = replicationCount,
      sampleSize = sampleSize + alphaIndex,
      lag = lag,
      lagCount = lagCount+alphaIndex,
      tParArray = tParArray,
      kernel = kernel,
      bandwidth = bandwidth,
      nonCoverageProbability = n)
}
  return(doubleAlphaArra)

}
