library(shiny)
library(leaflet)

ui <- fluidPage(
  leafletOutput("map",
                # TODO (optional): modify height based on your preference
                height = 600, 
                width = '100%'),
  absolutePanel(
    id = "controls",
    top = 40, left = 40,
    # TODO: Put controls in here
    
  )
)

server <- function(input, output, session) {
  # TODO
  
}

shinyApp(ui, server)