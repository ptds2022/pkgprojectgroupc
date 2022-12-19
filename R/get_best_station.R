#' @title get best station
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
get_best_station <- function(stations_in_radius){
  # This function gets the best station
  best_station <- stations_in_radius[which.min(stations_in_radius$price),]
  return(best_station)
}
