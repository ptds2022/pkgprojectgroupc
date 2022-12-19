# This function gets the stations that are within the desired radius (input
# by the user)
get_stations_in_radius <- function(stations_data, max_dist){
  return(stations_data[stations_data$distance < (max_dist*1000),])
}
