library(shiny)
library(leaflet)
library(leaflet.extras)

ui <- fluidPage(
  leafletOutput("map",
                height = 600, 
                width = '100%')
)

server <- function(input, output, session) {
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addSearchOSM(options = searchOptions(collapsed = F))
  })
}

shinyApp(ui, server)