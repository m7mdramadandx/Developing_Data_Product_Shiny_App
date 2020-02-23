library(shiny)
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot <- renderPlotly({
        wtFilter <- mtcars$wt >= input$wt[1] & mtcars$wt <= input$wt[2]
        cylFilter <- mtcars$cyl >= input$cyl[1] & mtcars$cyl <= input$cyl[2]
        
        data <- mtcars[wtFilter & cylFilter,]
        
        x <- data$mpg
        y <- data$wt
        color <- data$cyl
        
        
        plot_ly(x = ~x, y = ~y, color = ~color, type = "scatter", mode = "markers") %>%
            layout(title = input$title,
                   xaxis = list(title = 'mpg'),
                   yaxis = list(title = 'wt'))

    })
})
