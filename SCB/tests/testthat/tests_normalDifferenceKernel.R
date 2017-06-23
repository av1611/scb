normalDifferenceKernelTestFunction = function ()
{

  u = seq(-10, 10, 0.1)
  myK = normalDifferenceKernel (u)
  plotsDir = "Plots"
  if (!exists(plotsDir)) dir.create(plotsDir)
  setwd(plotsDir)
  fullPath <- "kernelPlot.pdf"
  pdf(fullPath)
  plot (myK ~ u)
  cat ("after plots")
  graphics.off()

}

# recollect the requirements to kernel
# like integration to 1
test_that("Testing normalDifferenceKernel properties",
          normalDifferenceKernelTestFunction())




