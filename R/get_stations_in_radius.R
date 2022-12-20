#' @title get stations in radius
#'
#' @description Selects form all the data only those gas stations which are in the radius given by the user
#' @param stations_data A \code{dataframe} with the data of the gas stations
#' @param max_dist A numeric value which determines the maximum distance in km
#' @return A \code{dataframe} with the data about the gas stations in the radius
#' @author Clarence, Franz, Mathieu, Lucas
#' @export
#' @examples
#' "hallo"
get_stations_in_radius <- function(stations_data, max_dist){
  # This function gets the stations that are within the desired radius (input
  # by the user)
  return(stations_data[stations_data$distance < (max_dist*1000),])
}
