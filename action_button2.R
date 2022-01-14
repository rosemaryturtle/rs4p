library(shiny)
library(tidyverse)

ui <- pageWithSidebar(
  # Title/header
  headerPanel('Fixed and updated'),
  
  # Take user input for # of observations
  sidebarPanel(
    sliderInput('num', 'Choose the number of observations',
                100, 1000, 360),
    actionButton('go', 'Update'),
  ),
  
  # Space for histogram plot
  mainPanel(
    plotOutput('plot1'),
    plotOutput('plot2')
  )
)

server <- function(input, output, session) {
  data <- eventReactive(input$go, {
    rnorm(input$num)
  })
  
  output$plot1 <- renderPlot(hist(data()))
  output$plot2 <- renderPlot(hist(data()))
}

shinyApp(ui, server)
