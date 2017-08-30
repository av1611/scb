
rm (list = ls())
myPath <- "../lab/graphics/out"
if(!dir.exists(myPath))
{
  dir.create(myPath)
}
myFileName <- gsub(" ","_",paste("myGraphWithBand&Cor_",Sys.time(),".jpg",sep = ""))
myFileName <- gsub(":","_",myFileName)
jpeg(paste(myPath,"/",myFileName,sep=""))
mySampleSize=10
myTParCount = 10
mockTParArray <- createTParArray(tParCount = myTParCount)
mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
myLag = 1
myLagCount = 4
myKernel = normalDifferenceKernel
myBandwidth = 0.5
myNonCoverageProbability=0.05

myMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)
correlation <- computeCor(lag = myLag, tvMa1CoefArray = myMA1CoefArray)

band1 <- createBand(
  tParArray = mockTParArray,
  lag = myLag,
  lagCount = myLagCount,
  bandwidth = myBandwidth,
  kernel = myKernel,
  sampleSize = mySampleSize,
  nonCoverageProbability = myNonCoverageProbability )


plot(x=c(-1:1),y=c(-1:1),type = "n", xlim=c(0:1))

lines(x=mockTParArray,y = band1[,1], type = "l", col="green")
lines(x=mockTParArray,y = band1[,2], type = "l", col="blue")
middle = (band1[,1] + band1[,2])/2
lines(x=mockTParArray,y = middle, type = "l", col = "brown")
lines(x=mockTParArray,y = correlation, type = "l", col="red")
lineArray <- c("Upper", "Middle", "Lower", "Correlation")
legend("bottom", title ="Correlation", lineArray, fill =c("blue", "brown", "green", "red"))
dev.off()
