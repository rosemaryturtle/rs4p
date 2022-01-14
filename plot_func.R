# It is a good practice to set these design parameters separately
# Design parameters could include fonts, font sizes, color palettes, etc.
font <- "Helvetica"
purple_pal6 <- c("#dadaeb", "#bcbddc", "#9e9ac8", "#756bb1", "#54278f")
purple_pal7 <- c("#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#4a1486")
text_size <- 15
axis_title_size <- 14
axis_text_size <- 12
geom_text_size <- 4
options(scipen = 999)


# Plot function that takes 3 arguments: x axis variable, y axis variable, and plot subtitle
# IMPORTANT: var_x and var_y must be strings (aka in quotes)!
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

# Call the function
depth_plot('year', 'inc', 'Household income by year in Bolivia (1985-2018)')

ggplot(bolivia) +
  geom_point(aes(.data[['year']]))