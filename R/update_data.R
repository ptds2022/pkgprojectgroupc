source(here::here("data-raw/webscrap_data.R")) # Maybe it's not necessary to keep !
#' @title update_data
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
update_data <- function(){
  # Webscrap data for latest prices
  full_set <- webscrap_data()

  # Adjust data to be used in the shiny app
  Address <- full_set$Address
  price <- as.numeric(gsub(",","", gsub(",",".", gsub(" CHF/kg",'', gsub(" CHF/l",'', full_set$Price)))))
  name <- full_set$Name
  type <- full_set$Type
  brand <- full_set$Brand

  # Turn addresses into a dataframe
  data_gasstations <- data.frame(Address = Address)

  # Get longitude and latitude for all addresses
  gasstations_geocode <- tmaptools::geocode_OSM(data_gasstations$Address,
                                                keep.unfound = TRUE)

  # Store longitude and latitude
  lat <- as.vector(gasstations_geocode$lat)
  lon <- as.vector(gasstations_geocode$lon)

  # Combine into a dataframe
  data_gasstations <- data.frame(name = name,
                                 Address = Address,
                                 price = price,
                                 lat = lat,
                                 lon = lon,
                                 distance = rep(1, length(lat)),
                                 type = type,
                                 brand = brand
  )

  # Omit missing values
  data_gasstations <- na.omit(data_gasstations)

  # Save as a .csv
  write.csv(data_gasstations, here::here("data/gas_station_distances.csv"))

  # Return
  return(data_gasstations)
}
