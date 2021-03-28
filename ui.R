#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("ShinyApp for Iris dataset"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("var",
                        label="Choose a variable to display", 
                        choices= c(
                            "Sepal.Length" = 1,
                            "Sepal.Width" = 2,
                            "Petal.Length" = 3,
                            "Petal.Width" = 4
                        ),
                        selected = 1
            ),
            sliderInput("bin",
                        "Number of bins:",
                        min = 10,
                        max = 60,
                        value = 30
            ),
            radioButtons(
                "radio",
                label = "Grouping variable by Species",
                choices = c("Yes", "No"),
                select = "No"
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Histogram",
                h4("Variable selected is:"),
                textOutput("textvar"),
                h4("Number of histogram BINs is:"),
                textOutput("textbin"),
                plotOutput("distPlot")
                ),
                tabPanel("Documentation",
                         mainPanel(includeMarkdown("documentation.Rmd"))
                )
            )
        )
    ))

)
