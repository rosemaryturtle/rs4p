library(shiny)
library(tidyverse)

# Set up for the shiny app -------------------------------------------------
# Read data
data <- read_csv()
# define function
depth_plot <- function(var_x, var_y, subtitle) {
  # Set y axis label based on variable selection
  y_axis_lab <- case_when(var_y == "inc" ~ "Household income (BOB)", 
                          var_y == "age" ~ "Age")
  
  # Here, the df is pre-defined
  # However, if you want to apply this function to other data frames, you can add df as an argument
  ggplot(df) +
    geom_line(aes(.data[[var_x]], .data[[var_y]], # Note how the var_x and var_y arguments are called
                  color = .data[[var_x]])) +
    # Use theme to get a unified look for all the plots
    theme_minimal() +
    theme(panel.grid.minor = element_blank(), 
          text = element_text(family = font, size = text_size), 
          axis.text = element_text(size = axis_text_size), 
          axis.title = element_text(size = axis_title_size)) +
    # Finally, define the labels and plot titles
    labs(x = "", y = y_axis_lab, subtitle = subtitle)
}

# UI -----------------------------
ui <- fluidPage(
  # Title/header
  # headerPanel('Simplest plotting'),
  'Bolivia app',
  
  # Take user input for # of observations
  # sidebarPanel(
  #   sliderInput('num', 'Choose the number of observations',
  #               100, 1000, 360)
  # ),
  
  radioButtons(inputId = 'var_x', label = 'Choose an x variable', ...),
  
  # Space for histogram plot
  mainPanel(
    plotOutput('plot1')
  )
)

# Server -------------------------------
server <- function(input, output, session) {
  
  # Generate a histogram of a certain number of observations,
  # with a mean of 0 and a standard deviation of 1
  output$plot1 <- renderPlot({
    hist(rnorm(input$var_x))
    })
  
  output$text <- renderText()
}

shinyApp(ui, server)
