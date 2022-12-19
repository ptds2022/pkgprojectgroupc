# This function gets the best station
get_best_station <- function(stations_in_radius){
  best_station <- stations_in_radius[which.min(stations_in_radius$price),]
  return(best_station)
}
