if (!require("rstudioapi"))
  install.packages("rstudioapi")
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

if (!require("roxygen2"))
  install.packages("roxygen2")
library(roxygen2)

if (!require("devtools"))
  install.packages("devtools")
library(devtools)
require(ggplot2)
setwd("SCB/")
roxygen2::roxygenise()
devtools::document()

# Loading the functions

noise_mean = 100
noise_sd = 0.1
sampling_time = 60000
corruption = sin #function(x){sqrt(x)}
T <- createT(number_steps = sampling_time)
T
Psi <- createPsi(model = corruption,
                   t = T)
Psi
Z = createZ(time = sampling_time,
              mean = noise_mean,
              sd = noise_sd)
Z

X <- createX(model = ma1,
               time = sampling_time,
               Z = Z,
               psi = Psi)
X
corrupted_ma1 = data.frame(T*sampling_time,X)
colnames(corrupted_ma1) <- c('time','sample')

pl_title = sprintf("Noise distribution: N(%d,%.2f), corruption is sin, time steps: %d", noise_mean, noise_sd, sampling_time)
jpeg(filename = paste(pl_title, ".jpg", sep = ""),width = 2*585, height = 2*403, units = "px", quality = 80)
ggplot(data=corrupted_ma1, aes(x = time, y = sample)) + geom_line() +
  xlab("Time steps") +
  ylab("Sample path") +
  ggtitle(pl_title) +
  theme(plot.title = element_text(face = "bold", hjust = .5, size = 25), axis.text = element_text(size=20), axis.title = element_text(size = 20))
dev.off()
