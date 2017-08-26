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

MyMA1CoefArray <- createTVMA1CoefArray(coefFunction = sin, sampleSize = sampleSize)
correlation <- computeCor(lag = lag, tvMa1CoefArray = MyMA1CoefArray)
t <- createTParArray(tParCount = sampleSize)
plot(x = t,y = correlation, type="l")

jpeg("mygraph.jpg")

