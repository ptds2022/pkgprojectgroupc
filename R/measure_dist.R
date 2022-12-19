#' @title measuring distance function
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
