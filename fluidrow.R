library(shiny)

img_src <- 'fakurian-design-58Z17lnVS4U-unsplash.jpg'

ui <- fluidPage(
  tabsetPanel(
    # Basic setup
    tabPanel('example1',
             img(src = img_src,
                 style = 'width: 100%')
             ),
    
    # Without fluidRow() and column(), the elements will go from top to bottom
    tabPanel('example2',
             img(src = img_src,
                 style = 'width: 50%'),
             img(src = img_src,
                 style = 'width: 50%')),
    
    # fluidRow() and column() allows elements to go from left to right. 
    # All HTML containers, including fluidRow() have a width of 12 
    # So all columns widths added together must be 12 at most
    # Note that 'width: 100%' refers to 100% of the immediate container (aka column()), rather than 100% of the entire page
    tabPanel('example3',
             fluidRow(
               column(6,
                      img(src = img_src,
                          style = 'width: 100%')),
               column(6,
                      img(src = img_src,
                          style = 'width: 100%'))
             )),
    
    # You can also change the width % to control image size, in this case
    # But this doesn't always work for *Input() and *Output() objects (always test it out)
    tabPanel('example4',
             fluidRow(
               column(6,
                      img(src = img_src,
                          style = 'width: 25%')),
               column(6,
                      img(src = img_src,
                          style = 'width: 50%'))
             )),
    
    # Different ways of using fluidRow() and column()
    tabPanel('example5',
             # You can put static text
             fluidRow(h2('cool pics')),
             
             # All column widths added together can be <12
             fluidRow(
               column(8,
                      img(src = img_src,
                          style = 'width: 100%'))
             ),
             
             # You can optionally use offset to make a column start not at the left edge of the page
             fluidRow(
               column(4,
                      offset = 4,
                      img(src = img_src,
                          style = 'width: 100%'))
             ),
             
             # You can put *Input() objects in columns, but notice how they don't span the full width of the column
             fluidRow(
               column(6,
                      textInput('test1', 'Enter text')),
               column(6,
                      textInput('test2', 'Enter more text'))
             ),
             
             # You can even put a fluidRow() inside a column!
             # And this inner fluidRow() will once again have a width of 12
             # (all widths are relative to the container!)
             fluidRow(
               column(6,
                      fluidRow(
                        column(3,
                               img(src = img_src,
                                   style = 'width: 100%'))
                      ))
             ))
  )
)

server <- function(input, output, session) {}

shinyApp(ui, server)