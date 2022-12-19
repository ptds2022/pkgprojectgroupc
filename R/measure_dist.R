#' @title measuring distance function
#'
#' @description computes the distances between the current location and the location of the gas stations
#' @param data_gasstations A \code{dataframe} with all information about the gas stations
#' @param lat Latitude of the user
#' @param long Longitude of the user
#' @return The gas station \code{dataframe} with an extra distance column
#' @author Clarence, Franz, Mathieu, Lucas
#' @export
#' @examples
#' "hallo"
measure_dist <- function(data_gasstations, lat, long){
  # If getting the current location of user doesn't work
  if (is.null(lat) & is.null(long)){
    lat <- 46.524239
    long <- 6.583689
  }

  for(i in 1:length(data_gasstations[,1])){
    # Adding distances to dataset
    data_gasstations[i,6] <- geosphere::distHaversine(c(data_gasstations$lat[i],
                                                        data_gasstations$lon[i]),
                                                      c(as.numeric(lat),
                                                        as.numeric(long)))
  }

  # Omit missing distances
  data_gasstations <- na.omit(data_gasstations)

  # Return value
  return(data_gasstations)
}
