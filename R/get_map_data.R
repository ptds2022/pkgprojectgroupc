#' @title get map data
#'
#' @description creation of map data: take data from gas stations and adds spatial data of user
#' @param stations_in_radius Data of the gas station in the radius
#' @param lat Latitude of the user
#' @param long Longitude of the user
#' @param best_station A one line \code{dataframe} with the best gas station
#' @return A \code{dataframe} with information about the gas stations and the user
#' @author Clarence, Franz, Mathieu, Lucas
#' @export
#' @examples
#' "hallo"
get_map_data <- function(stations_in_radius, lat, long, best_station){
  # Add another row for location to the dataset
  map_data <- rbind(stations_in_radius,
                    data.frame(
                      name = stations_in_radius[2,1],
                      Address = stations_in_radius[2,2],
                      price = stations_in_radius[2,3],
                      lat = as.numeric(lat),
                      lon = as.numeric(long),
                      distance = stations_in_radius[2,6],
                      type = stations_in_radius[2,7],
                      brand = stations_in_radius[2,8]
                    ))


  # Label the row entries as either gasstation or location applicant or best gas station
  Locations <- rep("Hello", length(map_data[,1]))

  for(i in 1:length(map_data[,1])){
    if(all(map_data[i,] == best_station[1,])){
      Locations[i] <- "best gas station"
    } else if(all(map_data[i,] == map_data[length(map_data[,1]),])){
      Locations[i] <- "location applicant"
    } else{
      Locations[i] <- "gas station"
    }
  }

  map_data <- cbind(map_data,
                    Locations = Locations
  )

  # Return map data
  return(map_data)
}
