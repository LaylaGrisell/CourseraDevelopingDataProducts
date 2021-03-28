#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$textvar<- renderText({
        variable = as.numeric(input$var)
        colnames(iris[variable])
    })
    
    output$textbin<- renderText(input$bin)

    output$distPlot <- renderPlot({
      
        variable<- as.numeric(input$var)
        if(input$radio=="Yes")	{	
            p1<- ggplot(data=iris, 
                        aes(x=iris[,variable], fill=iris$Species
                        )
            ) + geom_histogram(bins=input$bin, colour="black") + 
                xlab(colnames(iris)[variable]) + 
                labs(fill="Species")
            
            print(p1)
        } else {
            
        p<- ggplot(data=iris, 
                   aes(x = iris[,variable])) + 
                geom_histogram(fill="steelblue",colour="black", bins=input$bin) +
            xlab(colnames(iris)[variable])
        
        print(p)
            
        }  

    })

})
