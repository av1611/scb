
rm (list = ls())
if(!dir.exists("../lab/graphics/out"))
{
  dir.create("../lab/graphics/out")
}

jpeg("../lab/graphics/out/mygraphWithBand&Cor.jpg")
mySampleSize=10
myTParCount = 10
mockTParArray <- createTParArray(tParCount = myTParCount)
mockTVMA1Array <- createTVMA1CoefArray(coefFunction = sin,sampleSize = mySampleSize)
myLag = 1
myLagCount = 4
myKernel = normalDifferenceKernel
myBandwidth = 0.5
myNonCoverageProbability=0.05

MyMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, sampleSize = mySampleSize)
correlation <- computeCor(lag = myLag, tvMa1CoefArray = MyMA1CoefArray)

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
