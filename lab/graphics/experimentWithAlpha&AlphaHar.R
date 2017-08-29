rm (list = ls())
myPath <- "../lab/graphics/out"
if(!dir.exists(myPath))
{
  dir.create(myPath)
}
myFileName <- gsub(" ","_",paste("myGraphWithAlpha&AlphaHat_",Sys.time(),".jpg",sep = ""))
myFileName <- gsub(":","_",myFileName)
#jpeg(paste(myPath,"/",myFileName,sep=""))
#dev.off()
alpha <- 0.8
alphaHat <- c(0.72,0.75,0.82,0.78,0.7,0.83)

arrayOfXAplphaHat <- array(alpha,dim = (length(alphaHat)))

plot(x=c(0,1),y=c(0,1),type ="n")
abline(a = 0 , b =1)
points(x=alpha, y=0,col="blue")
points(x=arrayOfXAplphaHat,y=alphaHat,col="red")
