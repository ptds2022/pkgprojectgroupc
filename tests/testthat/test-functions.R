
test_that("test measure_dist", {
  address_applicant <- "Avenue des Bains 14, 1007 Lausanne"
  lat <- as.numeric(tmaptools::geocode_OSM(address_applicant,
                                           keep.unfound = TRUE)$coords[2])
  long <- as.numeric(tmaptools::geocode_OSM(address_applicant,
                                            keep.unfound = TRUE)$coords[1])

  addresses <- c("Unter den Linden 25, 10117 Berlin",
                 "Avenue des Bains 12, 1007 Lausanne",
                 "Kurfürstendamm 100, 10709 Berlin")

  data_gasstations <- data.frame(Address = c("Unter den Linden 25, 10117 Berlin",
                                             "Avenue des Bains 12, 1007 Lausanne",
                                             "Kurfürstendamm 100, 10709 Berlin"),
                                 lat = tmaptools::geocode_OSM(addresses,
                                                              keep.unfound = TRUE)$lat,
                                 lon = tmaptools::geocode_OSM(addresses,
                                                              keep.unfound = TRUE)$lon,
                                 na1 = rep(1, 3),
                                 na2 = rep(1, 3),
                                 distance = rep(1, 3)
  )

  expect_equal(measure_dist(data_gasstations = data_gasstations,
                            lat = lat,
                            long = long)[2,6],
               0)
})

