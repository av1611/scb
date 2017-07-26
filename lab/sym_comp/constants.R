

if (! require ("Ryacas"))
  install.packages("Ryacas")
library(Ryacas)


K = function (x)
{
  return (2*(2*pi)^(-1/2) * exp (-(x^2) / 2) - (2*pi)^(-1/2) * exp (-((x/sqrt(2))^2) / 2) / sqrt (2))
}



INT_SQ_DER = 0.306951
PHI_K_NORMAL_DIF = 0.4065

CK = 0.5 * log (INT_SQ_DER / (4 * pi^2 * PHI_K_NORMAL_DIF))
CK


