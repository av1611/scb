  rm (list = ls())

  myTParCount  <-10
  myTParArray  <- createTParArray(tParCount = myTParCount)
  mySuperReplicationCount <- 10
  myReplicationCount <- 10
  mySampleSize <- 50
  myLag <- 1
  myLagCount <- 4
  myKernel <- normalDifferenceKernel
  myBandwidth <- 0.5
  myNonCoverageProbabilitys <- c(0.2,0.4,0.6,0.8)

  myPath <- "../lab/graphics/out"
  if(!dir.exists(myPath))
  {
    dir.create(myPath)
  }
  myFileName <- gsub(" ","_",paste("myGraphWithAlpha&AlphaHat_",Sys.time(),".jpg",sep = ""))
  myFileName <- gsub(":","_",myFileName)
  jpeg(paste(myPath,"/",myFileName,sep=""))

  alphaHats <- matrix(0,nrow = mySuperReplicationCount, ncol = length(myNonCoverageProbabilitys))
  for(i in 1:length(myNonCoverageProbabilitys))
  {
      alphaHats[,i] <- computeNonCoverageFreqArray(
      superReplicationCount = mySuperReplicationCount,
      replicationCount = myReplicationCount,
      sampleSize = mySampleSize,
      lag = myLag,
      lagCount = myLagCount,
      tParArray = myTParArray,
      kernel = myKernel,
      bandwidth = myBandwidth,
      nonCoverageProbability = myNonCoverageProbabilitys[i]
    )
  }

  arrayOfXAplphaHats <- matrix(0, nrow = length(alphaHats[,1]),
                              ncol = length(myNonCoverageProbabilitys))
  for(i in 1:length(myNonCoverageProbabilitys))
  {
    arrayOfXAplphaHats[,i] <- array(myNonCoverageProbabilitys[i],dim = length(alphaHats[,1]))
  }

  plot(x=c(0,1),y=c(0,1),type ="n",main="Alphas and AlphaHats")
  abline(a = 0 , b =1)

  for(i in 1:length(myNonCoverageProbabilitys))
  {
    points(x=myNonCoverageProbabilitys[i], y=0,col="blue")
    points(x=arrayOfXAplphaHats[,i],y=alphaHats[,i],col="red")
  }
  dev.off()
