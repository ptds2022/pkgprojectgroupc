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