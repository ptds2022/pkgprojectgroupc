# Current location
address_applicant <- "Avenue des Bains 12, 1007 Lausanne"

# Gas station addresses
addresses <- data.frame(c("Unter den Linden 25, 10117 Berlin",
               "Avenue des Bains 12, 1007 Lausanne",
               "Kurfürstendamm 100, 10709 Berlin"),
               lat = tmaptools::geocode_OSM(data_gasstations$Address,
                                            keep.unfound = TRUE)$lat,
               lon = tmaptools::geocode_OSM(data_gasstations$Address,
                                            keep.unfound = TRUE)$lon,
               rep(NA, 3),
               rep(NA, 3),
               rep(NA, 3)
)

test_results <- measure_dist(data_gasstations = addresses, address_applicant)


# Test
if (test_results$distance[3] != 0){
  stop("Something is wrong with the computation of measure_dist")
}
