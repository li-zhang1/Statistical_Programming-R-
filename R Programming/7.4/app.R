#### Exercise 7.4 Solution: 
library(shiny)
# Define UI for application that draws a histogram
ui <- fluidPage(
    
    # Application title
    titlePanel("Interactive page for iris data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("cid", "Select the column", choices = colnames(iris)),
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 12)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("Plot")
        ) 
    )
)

# Define server logic required to draw a histogram and pie plot

server <- function(input, output) {
    
    output$Plot <- renderPlot({
        
        x    <- iris[, input$cid]
        
        # draw the histogram with the specified number of bins for variable columns
        if (input$cid %in% colnames(iris)[colnames(iris) %in% c("Sepal.Length","Sepal.Width", "Petal.Length","Petal.Width")]){
            bins <- seq(min(x), max(x), length.out = input$bins + 1)
            titl <- paste("Histogram of", input$cid, sep = " ")
            hist(x, breaks = bins, col = 'green', border = 'white', main = titl)
            
            # draw the pie plot for catogorical column Species
            }else{
            count <- table(x)
            labl <- paste(names(count), "\n", count, sep = "")
            titl <- paste("Pie plot of", input$cid, sep = " ")
            pie(count, labels = labl, main = titl)
        }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
