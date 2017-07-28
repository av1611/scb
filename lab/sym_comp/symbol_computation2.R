if (! require ("Ryacas"))
  install.packages("Ryacas")
library(Ryacas)

x <- Sym("x")


normDifKernel <- function(x)
{
  2 * dnorm(x) - dnorm(x / sqrt(2)) * (1 / sqrt(2))
}

normDifKernel(-4)


KDerive <- Ryacas::yacas(deriv(normDifKernel(x), x))
KDerive$text
lowBound <- -6
upBound <- 6


KDerivSquared <- Eval(yacas((KDerive$text)^2))


KDerivIntegrated <- Ryacas::Integrate.default(f = KDerivSquared,
                                              x = x,
                                              a = lowBound,
                                              b = upBound)


normDifKernelSquared <- Eval(yacas((normDifKernel(x))^2))


phiKNormalDif <- Ryacas::Integrate.default(f = normDifKernelSquared,
                                           x = x,
                                           a = lowBound,
                                           b = upBound)

print(yacas(expression(integrate(1 / x, x))))
print(Eval(yacas(expression(2 * x))))

CK <- 0.5 * log (KDerivIntegrated / (4 * pi^2 * phiKNormalDif))
CK
