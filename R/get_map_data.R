#' @title get map data
#'
#' @description computes the distances between the current location and the location of the gas stations
#' @param addresses A \code{vector} with the addresses of the gasstation and the location of the applicant
#' @return A \code{dataframe} with information about:\describe{
#'    \item{the addresses}
#'    \item{the latitutes}
#'    \itemt{the longitute}
#'    \item{the distances}
#' }
#' @author Clarence, Franz, Mathieu, Lucas
#' @export
#' @examples
#' addresses <- c("Unter den Linden 25, 10117 Berlin", "Av. de la Gare 12, 1003 Lausanne", "Kurfürstendamm 100, 10709 Berlin")
#' measure_dist(addresses = addresses)
get_map_data <- function(stations_in_radius, lat, long){
  # Add another row for location to the dataset
  map_data <- rbind(stations_in_radius(), c(NA,NA, NA,
                                            as.numeric(lat),
                                            as.numeric(long),
                                            NA, NA)
  )

  # Label the row entries as either gasstation or location applicant
  map_data <- cbind(map_data,
                    Locations = c(rep("gasstation",
                                      length(map_data[,1])-1),
                                  "location applicant")
  )

  # Return map data
  return(map_data)
}
