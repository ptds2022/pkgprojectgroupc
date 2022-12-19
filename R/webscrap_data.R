#' @title webscrap data
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
webscrap_data <- function(){
  # # Fetch gas station informations
  # url for Aargau province gas stations
  url_Aargau <- "https://ch.fuelo.net/gasstations/province/230?lang=en"

  # scrape gas station data for Aargau province and store it in Aargau_station
  Aargau_station <- read_html(url_Aargau) %>%
    html_table() %>%
    .[[2]]

  # url for Appenzell province gas stations
  url_Appenzel <- "https://ch.fuelo.net/gasstations/province/232?lang=en"

  # scrape gas station data for Appenzell province and store it in Appenzel_station
  Appenzel_station <- read_html(url_Appenzel) %>%
    html_table() %>%
    .[[2]]

  # url for Basel country side gas stations
  url_Basel_country_side <- "https://ch.fuelo.net/gasstations/province/233?lang=en"

  # scrape gas station data for Basel country side and store it in Basel_country_side_station
  Basel_country_side_station <- read_html(url_Basel_country_side) %>%
    html_table() %>%
    .[[2]]

  # url for Basel city gas stations
  url_Basel_city <- "https://ch.fuelo.net/gasstations/province/234?lang=en"

  # scrape gas station data for Basel city and store it in Basel_city_station
  Basel_city_station <- read_html(url_Basel_city) %>%
    html_table() %>%
    .[[2]]

  # url for Bern province gas stations
  url_Bern <- "https://ch.fuelo.net/gasstations/province/235?lang=en"

  # scrape gas station data for Bern province and store it in Bern_station
  Bern_station <- read_html(url_Bern) %>%
    html_table() %>%
    .[[2]]

  # url for Geneva province gas stations
  url_geneva <- "https://ch.fuelo.net/gasstations/province/237?lang=en"

  # scrape gas station data for Geneva province and store it in geneva_station
  geneva_station <- read_html(url_geneva) %>%
    html_table() %>%
    .[[2]]

  # url for Glarus province gas stations
  url_glarus <- "https://ch.fuelo.net/gasstations/province/238?lang=en"

  # scrape gas station data for Glarus province and store it in glarus_station
  glarus_station <- read_html(url_glarus) %>%
    html_table() %>%
    .[[2]]

  # url for Jura province gas stations
  url_jura <- "https://ch.fuelo.net/gasstations/province/240?lang=en"

  # scrape gas station data for Jura province and store it in jura_station
  jura_station <- read_html(url_jura) %>%
    html_table() %>%
    .[[2]]

  # url for Lucerne province gas stations
  url_luzern <- "https://ch.fuelo.net/gasstations/province/241?lang=en"

  # scrape gas station data for Lucerne province and store it in luzern_station
  luzern_station <- read_html(url_luzern) %>%
    html_table() %>%
    .[[2]]

  # url for Neuchâtel province gas stations
  url_neuchatel <- "https://ch.fuelo.net/gasstations/province/242?lang=en"

  # scrape gas station data for Neuchâtel province and store it in neuchatel_station
  neuchatel_station <- read_html(url_neuchatel) %>%
    html_table() %>%
    .[[2]]

  # url for St. Gallen province gas stations
  url_st_gallen <- "https://ch.fuelo.net/gasstations/province/245?lang=en"

  # scrape gas station data for St. Gallen province and store it in st_gallen_station
  st_gallen_station <- read_html(url_st_gallen) %>%
    html_table() %>%
    .[[2]]

  # url for Schaffhausen province gas stations
  url_schaffausen <- "https://ch.fuelo.net/gasstations/province/246?lang=en"

  # scrape gas station data for Schaffhausen province and store it in schaffausen_station
  schaffausen_station <- read_html(url_schaffausen) %>%
    html_table() %>%
    .[[2]]

  # url for Schwyz province gas stations
  url_schwitz <- "https://ch.fuelo.net/gasstations/province/247?lang=en"

  # scrape gas station data for Schwyz province and store it in schwitz_station
  schwitz_station <- read_html(url_schwitz) %>%
    html_table() %>%
    .[[2]]

  # url for Solothurn province gas stations
  url_solothurn <- "https://ch.fuelo.net/gasstations/province/248?lang=en"

  # scrape gas station data for Solothurn province and store it in solothurn_station
  solothurn_station <- read_html(url_solothurn) %>%
    html_table() %>%
    .[[2]]

  # url for Thurgau province gas stations
  url_thurgau <- "https://ch.fuelo.net/gasstations/province/249?lang=en"

  # scrape gas station data for Thurgau province and store it in thurgau_station
  thurgau_station <- read_html(url_thurgau) %>%
    html_table() %>%
    .[[2]]

  # url for Ticino province gas stations
  url_ticino <- "https://ch.fuelo.net/gasstations/province/250?lang=en"

  # scrape gas station data for Ticino province and store it in ticino_station
  ticino_station <- read_html(url_ticino) %>%
    html_table() %>%
    .[[2]]

  # url for Uri province gas stations
  url_uri <- "https://ch.fuelo.net/gasstations/province/251?lang=en"

  # scrape gas station data for Uri province and store it in uri_station
  uri_station <- read_html(url_uri) %>%
    html_table() %>%
    .[[2]]

  # url for Valais province gas stations
  url_valais <- "https://ch.fuelo.net/gasstations/province/252?lang=en"

  # scrape gas station data for Valais province and store it in valais_station
  valais_station <- read_html(url_valais) %>%
    html_table() %>%
    .[[2]]

  # url for Vaud province gas stations
  url_vaud <- "https://ch.fuelo.net/gasstations/province/253?lang=en"

  # scrape gas station data for Vaud province and store it in vaud_station
  vaud_station <- read_html(url_vaud) %>%
    html_table() %>%
    .[[2]]

  # url for Zug province gas stations
  url_zug <- "https://ch.fuelo.net/gasstations/province/254?lang=en"

  # scrape gas station data for Zug province and store it in zug_station
  zug_station <- read_html(url_zug) %>%
    html_table() %>%
    .[[2]]

  # url for Zurich province gas stations
  url_zurich <- "https://ch.fuelo.net/gasstations/province/255?lang=en"

  # scrape gas station data for Zurich province and store it in zurich_station
  zurich_station <- read_html(url_zurich) %>%
    html_table() %>%
    .[[2]]

  # # Combine all individual province gas station data into one data frame called all_stations
  all_stations <- rbind(Aargau_station, Appenzel_station, Basel_city_station, Basel_country_side_station, Bern_station, geneva_station,
                        glarus_station,jura_station, luzern_station, neuchatel_station, schaffausen_station, schwitz_station, solothurn_station,
                        st_gallen_station, thurgau_station, ticino_station, uri_station, valais_station, vaud_station,zug_station,
                        zurich_station)

  # Exclude the 4th and 5th columns (-4,-5) from the data frame
  all_stations <- all_stations[c(-4,-5)]

  # Use the separate() function to split the "Name" column into two new columns: "Brand" and "Name"
  all_stations <- all_stations %>% separate(Name, c("Brand", "Name"))


  # # Get gas price
  # url for unleaded gasoline prices
  unlead_prices_url <- "https://ch.fuelo.net/fuel/type/gasoline?lang=en"

  # scrape unleaded gasoline prices and store it in unlead_prices
  unlead_prices <- read_html(unlead_prices_url) %>%
    html_table() %>%
    .[[1]]

  # add a new column to unlead_prices indicating the type of fuel
  unlead_prices$new <- "unlead95"

  # url for diesel prices
  diesel_prices_url <- "https://ch.fuelo.net/fuel/type/diesel?lang=en"

  # scrape diesel prices and store it in diesel_prices
  diesel_prices <- read_html(diesel_prices_url) %>%
    html_table() %>%
    .[[1]]

  # add a new column to diesel_prices indicating the type of fuel
  diesel_prices$new <- "diesel"

  # url for unleaded gasoline with 98 octane ratings
  unlead98_prices_url <- "https://ch.fuelo.net/fuel/type/gasoline98?lang=en"

  # scrape unleaded gasoline with 98 octane ratings and store it in unlead98_prices
  unlead98_prices <- read_html(unlead98_prices_url) %>%
    html_table() %>%
    .[[1]]

  # add a new column to unlead98_prices indicating the type of fuel
  unlead98_prices$new <- "unlead98"

  # url for compressed natural gas (CNG) prices
  cng_prices_url <- "https://ch.fuelo.net/fuel/type/methane?lang=en"

  # scrape compressed natural gas and store it in cng_prices
  cng_prices <- read_html(cng_prices_url)%>%
    html_table() %>%
    .[[1]]

  # add a new column to cng_prices indicating the type of fuel
  cng_prices$new <- "cng"

  # # Create dataframes
  # bind all the gas price data together into a single data frame
  all_prices <- rbind(unlead_prices, unlead98_prices, diesel_prices, cng_prices)
  # split the "X1" column into three separate columns called "Brand", "Type", and "Specificity"
  all_prices <- all_prices %>% separate(X1, c("Brand", "Type", "Specificity"))
  # rename the "X2" and "X3" columns to "Price" and "Percentage_Change" respectively
  all_prices <- all_prices %>%
    rename(Price = X2,
           Percentage_Change = X3)
  # remove the 2nd and 3rd rows and rename the "new" column to "Type"
  all_prices <- all_prices[-c(2,3)] %>%
    rename(
      Type = new
    )

  # merge the gas station and gas price data together based on the "Brand" column
  full_set <- merge(
    all_stations,
    all_prices,
    by = "Brand"
  )

  # create a new column called "Address" which combines the "Address" and "City" columns, separated by a comma and space
  full_set$Address <- paste(full_set$Address, full_set$City, sep = ", ")

  # remove the column City from the dataframe
  full_set <- select(full_set, -City)

  # remove any instances of the "№" character from the "Address" column
  full_set$Address <- gsub('№','', full_set$Address)

  # write the data frame to a CSV file called "gas_station_data.csv" in the "data" folder
  write.csv(full_set, here::here("data/gas_station_data.csv"))

  # Return full_set data
  return(full_set)
}
