# pkgprojectgroupc

The aim of this package is to provide in real time the closest gas station for a consumers.

# 1. Project description

With this package the user will be provided a way to find the closest gas station depending on the price and the type of the gas that the user needs.
As output, you will get the adress as well as the location on the map. 

To run, this package will scrap information from "https://ch.fuelo.net/?lang=en" regarding price and location of gas station.
It will also attribute latitude and longitude coordinate for the location in a dataframe. 
Then it will calculate the distance between the point choosen and the gas station available to provide the best option.
Finally, it will output a shiny app to show the results.

# 2. Technology, source

We chose to scrap the data in real time in order to provide the user a result that is daily updated. 
We decided to use this website, as it provides enough data regarding Switzerland. Furthermore, it did not require an api key to scrap the information
For the map generation we use a google api which was free - embending.

# 3. Challenges

Not all the gaz station are published on that website. 
Therefore a few cantons remain empty and that is due to the fact that it is actually the users of that website that provide the informations and thus they are incomplete.

An extension could be made through the implementation of the journey to take from a starting point to an end point. However this would require to pay an API to Google.

# 4. How to install and run the project

In order to run the application, you need to download the whole package "pkgprojectgroupc". 
Then you run the file "main_app.R" on R. This will prompt up a shiny app that you can open on your browser. 
Once the app is loaded, you will be able to enter your adress in the section dedicated to it.
To load the website you have to run the three following command in the console once the package installed:
- library(pkgdown)
- usethis::use_pkgdown()
- pkgdown::build_site()

# 5. How to use the project

If you want to modify the project, you can do it through the "R" folder where all our function are located. 
Here is a quick guide on what those function are made for:
- "google_register.R" : Prompting the user to enter API key
- "webscrap_data.R" : it will scrap all the information from the website to generate the needed csv file.
- "update_data.R" : update the data from the source website in order to have your result updated to the current locations
- "measure_dist.R" : computes the distances between the current location and the location of the gas stations
- "get_station_in_radius.R" : computes the distances between the current location and the location of the gas stations
- "get_best_station.R" : Function made to provide the cheapest gaz station in terms of price
- "get_map_data.R" : Function to create the  map with all the latitude / longitude of each gaz station
- "run_app.R" : allows to load the shiny app to find the best gas station
