computeMEbyCovHatFunction = function()
{
  cat ("\n Testing \'computeME\'\n")
  myLag=2
  Mynoise = rnorm(n = 10,
                  mean = 0,
                  sd = 1)
tParCount=10
mockTParArray <- createTParArray(tParCount = tParCount)

  mockTVMA1CoeffArray <- createTVMA1CoefArray(coefFunction = sin,
                                              tParArray = mockTParArray)
  mockTVMA1 <- createTVMA1(sampleSize = tParCount,
                           tvMA1CoefArray = mockTVMA1CoeffArray,
                           noise=Mynoise)
  mysample=createSample(model = createTVMA1,tvMA1CoefArray = seq(from = 0,to = 1,
                                                               length.out = 10),
                        noise = Mynoise)
  Ck=computeMEbyCovHat(lag=myLag,sample=mysample,bandwidth = 4,alpha = 0.05)
  cat("ME",Ck,"\n")


}
test_that("Testing \'computeME\' ", {
  computeMEbyCovHatFunction()

}
)
