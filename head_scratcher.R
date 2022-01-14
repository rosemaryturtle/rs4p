library(shiny)
library(tidyverse)

ui <- pageWithSidebar(
  # Title/header
  headerPanel('Something is happening'),
  
  # Take user input for # of observations
  sidebarPanel(
    sliderInput('num', 'Choose the number of observations',
                100, 1000, 360)
  ),
  
  # Space for histogram plot
  mainPanel(
    plotOutput('plot1'),
    plotOutput('plot2')
  )
)

server <- function(input, output, session) {
  # Generate a histogram of a certain number of observations,
  # with a mean of 0 and a standard deviation of 1
  output$plot1 <- renderPlot(hist(rnorm(input$num)))
  output$plot2 <- renderPlot(hist(rnorm(input$num)))
}

shinyApp(ui, server)
