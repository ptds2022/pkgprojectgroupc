# testing measuring distance function

test_that("first distance is zero",{
  expect_equal(
    measure_dist(c("Unter den Linden 25, 10117 Berlin",
                   "Av. de la Gare 12, 1003 Lausanne", "Kurfürstendamm 100, 10709 Berlin"))[1,4], 0)
})
