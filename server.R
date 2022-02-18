#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#


library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    model <- lm(pressure ~ temperature, data= pressure)
    
    modelpred<- reactive({
        tempInput <- input$sliderTemperature
        predict(model, newdata= data.frame(temperature = tempInput))
    })
    output$plot1 <- renderPlot({
        tempInput <- input$sliderTemperature

        plot(pressure$temperature, pressure$pressure, 
             xlab= 'Temperature (deg C)',
             ylab= 'Pressure (mm)',
             bty='n', pch=14,
             xlim= c(0,400), ylim= c(0,800))
        if(input$showModel){
            abline(model, col='blue', lwd=3)
        }
        points(tempInput, modelpred(), col= 'blue', pch=16, cex=2)
    })
    output$pred <- renderText({
        modelpred()
    })
})
