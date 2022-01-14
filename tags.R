library(shiny)

ui <- fluidPage(
  h1('First header'),
  h2('Second header'),
  h3('Third header'),
  h4('Fourth header'),
  h5('Fifth header'),
  h6('Sixth header'),
  
  hr(),
  
  p('Just a regular paragraph.'),
  p('This one with some style!', 
    style = 'font-family: Verdana; font-size: 1.5em; color: purple'),
  p('Some words are', strong('bolded'), '.'),
  p('Other words are', tags$em('emphasized'), '. Or,', tags$i('italicized'), '.'),
  
  hr(),
  
  p('Sometimes you want a', code('ggplot'), 'in your app, like so:'),
  code('ggplot %>% geom_point(aes(x, y))'),
  p('Other times you just need a (line) break.'),
  br(),
  p('Phew!'),
  
  hr(),
  
  p('To add an image, put it in a subfolder named', code('www'), ', and then add it like so:'),
  # Just put the image name in src, no need to add www/ in front
  # width and/or height arguments are optional, but recommended for large images!
  img(src = 'fakurian-design-58Z17lnVS4U-unsplash.jpg',
      width = 200),
  
  hr(),
  
  p('For more info, see', 
    tags$a(href = 'https://vimeo.com/rstudioinc/review/131218530/212d8a5a7a#t=1h35m42s',
           'this tutorial'),
    '.')
)

server <- function(input, output) {}

shinyApp(ui, server)