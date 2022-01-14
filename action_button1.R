library(shiny)

ui <- fluidPage(
  sliderInput("obs", "Number of observations", 1, 1000, 500),
  actionButton("goButton", "Go!", class = "btn-success"),
  plotOutput("distPlot")
)

server <- function(input, output, session) {
  observeEvent(input$goButton, {
    output$distPlot <- renderPlot({
      hist(rnorm(isolate(input$obs)))
    })
  })
}

shinyApp(ui, server)