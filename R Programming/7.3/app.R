#### Exercise 7.3 Solution: 

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Iris Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(selectInput("cid", "column", choices = colnames(iris[,1:4])),
                     sliderInput("bins",
                                 "Number of bins:",
                                 min = 1,
                                 max = 50,
                                 value = 12)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- iris[, input$cid]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        titl <- paste("Histogram of", input$cid, sep =" ")
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'green', border = 'white', main = titl)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
