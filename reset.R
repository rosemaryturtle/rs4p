library(shiny)

ui <- fluidPage(
  sliderInput("obs", "Number of observations", 1, 1000, 500),
  actionButton("reset", "Reset"),
  plotOutput("distPlot")
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$obs))
  })
  
  observeEvent(input$reset, {
    updateSliderInput(inputId = 'obs', value = 500)
  })
}

shinyApp(ui, server)