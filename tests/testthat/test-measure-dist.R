library(testthat)
library(dplyr)

# Load data
data <- select(read.csv("../../data/gas_station_distances.csv"), -X)

# Enter lat and long
lat <- 46.524239
long <- 6.583689

# test for measure dist
test_that("test measure_dist",
            {
              # Test function output
              expect_equal(round(measure_dist(data, lat, long)[1,6]), 213151)
            }
)
  
  
