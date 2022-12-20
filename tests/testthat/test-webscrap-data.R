library(pkgprojectgroupc)
library(testthat)
library(here)

# test for webscrap_data
test_that("test webscrap_data",
          {
            # Test function output: Test correct column names
            expect_equal(names(webscrap_data(save_csv_folder="../../data/gas_station_data.csv")),
                         c("Brand", "Name", "Address", "Price",
                           "Percentage_Change", "Type"))
          }
)
