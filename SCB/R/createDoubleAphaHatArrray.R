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
  for (alphaIndex in 1: alphaCount)
{
    doubleAlphaArra[alphaIndex, ] = computeNonCoverageFreqArray(
      superReplicationCount = superReplicationCount,
      replicationCount = replicationCount,
      sampleSize = sampleSize + alphaIndex,
      lag = lag,
      lagCount = lagCount+alphaIndex,
      tParArray = tParArray,
      kernel = kernel,
      bandwidth = bandwidth,
      nonCoverageProbability = nonCoverageProbability+0.05)
}
  return(doubleAlphaArra)

}
