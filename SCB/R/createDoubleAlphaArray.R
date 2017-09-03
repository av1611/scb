createDoubleAlphaArray = function(superReplicationCount,
                                  replicationCount,
                                  sampleSize,
                                  lag,
                                  lagCount,
                                  alphaArray,
                                  tParArray,
                                  kernel = normalDifferenceKernel,
                                  bandwidth,
                                  nonCoverageProbability)

{
  alphaCount=length(alphaArray)
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
      nonCoverageProbability = alphaArray[alphaIndex])
}
  return(doubleAlphaArra)

}
