#' @title get stations in radius
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
get_stations_in_radius <- function(stations_data, max_dist){
  # This function gets the stations that are within the desired radius (input
  # by the user)
  return(stations_data[stations_data$distance < (max_dist*1000),])
}
