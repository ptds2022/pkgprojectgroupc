#' @title get best station
#'
#' @description picks the cheapest gas station from all the gas stations in the distance given by the user
#' @param stations_in_radius Dataframe with all the gas stations with all the gas stations in distance given by the user
#' @return A one row \code{dataframe} containing the data of the gas station with the cheapest price
#' @author Clarence, Franz, Mathieu, Lucas
#' @export
#' @examples
#' "hallo"
get_best_station <- function(stations_in_radius){
  # This function gets the best station
  best_station <- stations_in_radius[which.min(stations_in_radius$price),]
  return(best_station)
}
