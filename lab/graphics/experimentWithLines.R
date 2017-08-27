rm(list = ls())

myArray = 1 : 10
plot (myArray)
lines (myArray)

myX = 1 : 10
myY = 1 : 10
plot (myY ~ myX)
lines (myY ~ myX, col = "blue")


x  <- seq(-2, 2, 0.05)
y1 <- pnorm(x)
y2 <- pnorm(x,1,1)
plot(x,y1,type="l",col="red")
lines(x,y2,type="l",col="green")

rm (list = ls())

lag <- 1
sampleSize <- 200



dir.create("../lab/graphics/out")
# create if it does not exist


myMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, sampleSize = sampleSize)
myMA1CoefArray
plot (myMA1CoefArray)
correlation <- computeCor(lag = lag, tvMa1CoefArray = myMA1CoefArray)
correlation
plot (correlation)
myTParArray <- createTParArray(tParCount = sampleSize)
plot(x = myTParArray, y = correlation, type="l")

jpeg("../lab/graphics/out/mygraph.jpg")
dev.off()

rm (list = ls())
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


plot(x=c(-1:1),y=c(-1:1),type = "n" )
lines(x=mockTParArray,y = band1[,1], type = "l", col="blue")
lines(x=mockTParArray,y = band1[,2], type = "l", col="blue")
lines(x=mockTParArray,y = correlation, type = "l", col="red")
dev.off()

