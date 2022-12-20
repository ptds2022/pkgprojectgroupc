library(pkgprojectgroupc)
library(testthat)
library(tibble)

# Station 1
station_1 <- tibble(name = "M",
                    Address = "Station 1",
                    price = 3,
                    lat = 47.48743,
                    lon = 8.243244,
                    distance = 20,
                    type = "unlead98",
                    brand = "avia")

# Station 2
station_2 <- tibble(name = "M",
                    Address = "Station 2",
                    price = 2,
                    lat = 48.48743,
                    lon = 8.243244,
                    distance = 25,
                    type = "unlead98",
                    brand = "avia")

# Station_2
best_station <- tibble(name = "M",
                    Address = "Best station",
                    price = 1,
                    lat = 48,
                    lon = 8,
                    distance = 15,
                    type = "unlead98",
                    brand = "avia")

# Station in radius
stations_in_radius <- rbind(station_1, station_2, best_station)

# Enter lat and long
lat <- 46.524239
long <- 6.583689

# test for get_map_data
test_that("test get_map_data",
          {
            # Test function output: Correct distance calculation
            expect_equal(get_map_data(stations_in_radius, lat, long, best_station)$Locations,
                         c("location applicant", "gas station",
                           "best gas station", "gas station"))
          }
)
