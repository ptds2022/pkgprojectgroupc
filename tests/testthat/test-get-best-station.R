library(pkgprojectgroupc)
library(testthat)
library(tibble)

# Station 1
station_1 <- tibble(name = "M",
               Address = "Vogelsangstr. 13 A, Gebenstorf",
               price = 2,
               lat = 47.48743,
               lon = 8.243244,
               distance = 20,
               type = "unlead98",
               brand = "avia")

# Station_2
station_2 <- tibble(name = "M",
                       Address = "anywhere",
                       price = 1,
                       lat = 48,
                       lon = 8,
                       distance = 30,
                       type = "unlead98",
                       brand = "avia")

# Bind
stations <- rbind(station_1, station_2)

# test for get_best_station
test_that("test get_best_station",
          {
            # Test function output: Correct distance calculation
            expect_equal(get_best_station(stations)[[1,2]],
                         "anywhere")
          }
)
