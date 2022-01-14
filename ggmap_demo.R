library(shiny)
library(leaflet)
library(ggmap)

# Create a googleKey.R in the same folder and register your Google Key with ggmap
source('googleKey.R')

ui <- fluidPage(
  textInput('address', 'Enter address'),
  actionButton('search', 'Search'),
  textOutput('result1'),
  textOutput('result2')
)

server <- function(input, output, session) {
  latlon <- reactive({
    input$search
    geocode(isolate(input$address),
            output = "latlona", # this returns a list of 3: latitude, longitude, and address
            source = "google")
  })
  
  output$result1 <- renderText({
    if (!is.na(latlon())) {
      paste('Address:', latlon()$address)
    } else {
      ''
    }
  })
  
  output$result2 <- renderText({
    if (!is.na(latlon())) {
      paste('Coordinates:', latlon()$lon, latlon()$lat)
    } else {
      ''
    }
  })
}

shinyApp(ui, server)