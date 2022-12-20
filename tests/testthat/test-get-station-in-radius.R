library(pkgprojectgroupc)
library(testthat)
library(tibble)

# Load data
data <- tibble(name = "M",
               Address = "Vogelsangstr. 13 A, Gebenstorf",
               price = "1.93",
               lat = 47.48743,
               lon = 8.243244,
               distance = 500,
               type = "unlead98",
               brand = "avia")

# Max dist. in kilometers
max_dist = 1

# test for get_station_in_radius
test_that("test get_station_in_radius",
          {
            # Test function output: Correct distance calculation
            expect_equal(nrow(get_stations_in_radius(data, max_dist)), 1)
          }
)

