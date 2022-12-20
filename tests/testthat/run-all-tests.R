library(pkgprojectgroupc)
library(testthat)
library(here)
# source(here::here("R/webscrap_data.R"))
# source(here::here("R/get_map_data.R"))

testthat::test_dir(here::here("tests/testthat/"), report = "summary")
