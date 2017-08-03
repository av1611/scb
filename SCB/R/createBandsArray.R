


createBandsArray=function(count)
{
  for(index in 1:count)
  {
    replicationCount=index
band=createBand(X = rnorm(n = 10, mean = 0+index, sd = 1+index), nonCoverageProbability = 0.05)
cat("band",band,"\n")
bandslist=list(replicationCount,band)
}
bandslist
}
