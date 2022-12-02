#' @title measuring distance function
#'
#' @description computes the distances between the current location and the location of the gas stations
#' @param addresses A \code{vector} with the addresses of the gasstation and the location of the applicant
#' @return A \code{dataframe} with information about:\describe{
#'    \item{the addresses}
#'    \item{the latitutes}
#'    \itemt{the longitute}
#'    \item{the distances}
#' }
#' @author Clarence, Franz, Mathieu, Lukas
#' @export
#' @examples
#' addresses <- c("Unter den Linden 25, 10117 Berlin", "Av. de la Gare 12, 1003 Lausanne", "Kurfürstendamm 100, 10709 Berlin")
#' measure_dist(addresses = addresses)
measure_dist <- function(addresses){

  data_gasstations <- data.frame(addresses = addresses)

  gasstations_geocode <- tmaptools::geocode_OSM(data_gasstations$addresses)


  # calculation of distance between the coordinates (values in meter)
  lat <- as.vector(gasstations_geocode$lat)
  lon <- as.vector(gasstations_geocode$lon)

  coordinates <- matrix(c(lat,
                          lon),
                        nrow = length(lat))

  distance <- c(0)

  for(i in 2:length(coordinates[,1])){
    distance[i] <- geosphere::distHaversine(coordinates[i,], coordinates[1,])
  }

  data_gasstations <- as.data.frame(cbind(addresses, as.vector(gasstations_geocode$lat),
                            as.vector(gasstations_geocode$lon), distance))

  return(data_gasstations)
}

