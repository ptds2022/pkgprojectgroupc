source(here::here("data-raw/webscrap_data.R")) # Maybe it's not necessary to keep !

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
