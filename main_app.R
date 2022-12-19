library("shiny")
library("shinyWidgets")
library("ggmap")
library("tidyverse")


# Frontend
ui <- fluidPage(
  setBackgroundColor(
    color = "LightSkyBlue"
  ),

  # Application title
  titlePanel("Gas Station Finder",
             h3("This website helps you to find the best gas station!")),

  # Get the user's current location
  tags$script('
      $(document).ready(function () {
        navigator.geolocation.getCurrentPosition(onSuccess, onError);

        function onError (err) {
          Shiny.onInputChange("geolocation", false);
        }

        function onSuccess (position) {
          setTimeout(function () {
            var coords = position.coords;
            console.log(coords.latitude + ", " + coords.longitude);
            Shiny.onInputChange("geolocation", true);
            Shiny.onInputChange("lat", coords.latitude);
            Shiny.onInputChange("long", coords.longitude);
          }, 1100)
        }
      });'),

  # Layout of the page for user input
  sidebarLayout(
    sidebarPanel(
      numericInput("max_dist",
                   label = "chose the maximum distance you want to drive in km",
                   value = 5
      ),
      selectInput("type", label = "please select the desired fuel type",
                  choices = c("unlead98", "diesel", "cng"),
                  selected = "unlead98"),
    ),

    mainPanel(strong("The best gas station is:"),
      textOutput("best_gasstation"),
      strong("Map with current position and closest gas stations:"),
      plotOutput("map")
    )
  ))

# # Backend
# Get latest data in a format that can be processed by the app
data_update <- readline(prompt = "Do you want to update the data? ~5 minutes (Enter 1 (yes) 0 (no): ")
if (data_update == 1){
  data_gasstations <- update_data()
} else {
  data_gasstations <- select(read.csv(here::here("data/gas_station_distances.csv")), -X)
}

server <- function(input, output){

  stations_data <- reactive({
    # Adjust data based on user input
    data_gasstations <- data_gasstations[data_gasstations$type == input$type,]

    # Add distances to data_gasstations
    measure_dist(data_gasstations, input$lat, input$long)
  })

  stations_in_radius <- reactive({
    # Determine best gas station
    get_stations_in_radius(stations_data(), input$max_dist)
  })

  best_station <- reactive({
    # Get the best gasstation
    get_best_station(stations_in_radius())
  })

  output$best_gasstation <- renderText({
    # Check if there is a station in the radius given by the user
    # If there is no station, indicate to the user
    if(all(dim(best_station()) == c(0,8))){
      "There is no gas station within this distance"
    }
    else{
      # Return the address of the best station
      paste0(
        paste(best_station()[1,8], best_station()[1,1]),
        paste(", Address of the best gas station is:", best_station()[1,2])
      )
    }
  })

  mapInput <- reactive({
    # Access to Google map through the API
    if (is.null(input$lat) & is.null(input$long)){
      ggmap::get_map(paste(46.524239, 6.583689), zoom = 12)  # If getting the current location of user doesn't work
    } else {
      ggmap::get_map(paste(input$lat, input$long), zoom = 12) # If current location of user is available
  }})

  map_dataInput <- reactive({
    # Get data for the map
    get_map_data(stations_in_radius, input$lat, input$long)
  })

  output$map <- renderPlot({
    if(all(dim(best_station()) == c(0,8))){
      # If there is no gas station, don't return any map
    }else{
      # If there at least one gas station, return the map
      ggmap::ggmap(mapInput()) +
        ggplot2::geom_point(data = map_dataInput(),
                            aes(x = lon, y = lat, color = Locations),
                            size = 3) +
        ggplot2::theme(
          plot.background = element_rect(fill = 'transparent', color = NA),
          legend.background = element_rect(fill='transparent')
        )
    }
  }, bg = "transparent")
}

# Connection to server
shinyApp(ui = ui, server = server)
