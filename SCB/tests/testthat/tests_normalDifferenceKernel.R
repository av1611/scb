
normalDifferenceKernelTestFunction = function ()
{

  u = seq(-10, 10, 0.1)
  myK = normalDifferenceKernel (u)
  plot (myK ~ u)
}

test_that("Testing ma1 for length and being numeric",
          normalDifferenceKernelTestFunction())




