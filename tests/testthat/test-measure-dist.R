library(pkgprojectgroupc)
library(testthat)
library(dplyr)
library(tibble)

# Load data
data <- tibble(name = "M",
               Address = "Vogelsangstr. 13 A, Gebenstorf",
               price = 1.93,
               lat = 47.48743,
               lon = 8.243244,
               distance = 1,
               type = "unlead98",
               brand = "avia")

# Enter lat and long
lat <- 46.524239
long <- 6.583689

# test for measure_dist
test_that("test measure_dist",
            {
              # Test function output: Correct distance calculation
              expect_equal(round(measure_dist(data, lat, long)[[1,6]]), 213151)
            }
)


