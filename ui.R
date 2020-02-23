library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Car mpg affected by weight and cylinders"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("title", "Plot title", "MPG by Wt and cyl"),
            sliderInput("wt",
                        "Weight (1000 lbs):",
                        min = 1.5,
                        max = 5.5,
                        value = c(1.5, 5.4)),
            sliderInput("cyl",
                        "Number of cylinders:",
                        min = 4,
                        max = 8,
                        value = c(4, 8))
        ),

        # Show a plot of the generated distribution
        mainPanel(
            
            tabsetPanel(type = "tabs",
                        tabPanel("Plot", plotlyOutput("plot")),
                        tabPanel("Documentation", div(tags$h4("Summary"),
                                                      "The scatter plot will show of the relationship with the weight and cylinder with miles per galon.",
                                                      tags$h4("Plot"),
                                                      tags$ul(
                                                          tags$li("The wt is on the x axis."),
                                                          tags$li("The mpg is on the y axis."),
                                                          tags$li("The cyl is on the color of the graph.")
                                                            ),
                                                      tags$h4("Input"),
                                                      tags$ul(
                                                              tags$li("Plot title changes the title of the plot."),
                                                              tags$li("The Weight and the cylinders inputs filter the plot."))
                                                      )
                                 )
            )
        )
    )
))
