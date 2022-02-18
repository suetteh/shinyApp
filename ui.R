#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# This application facilitates the prediction of vapor pressure of mercury based
# on the temperature reading (deg Celsius).
#
# How it works:
# 1. Slide the bar on the left to select the temperature reading and the vapor pressure
# of mercury will be predicted with the linear model. 

# 2. The linear model could be viewed by clicking the check-box on the left which indicates
# show/hide model.By checking the check-box, a blue line will be shown in the graph
# which is the linear model used to predict the reading of pressure.The blue dot
# represents the temperature reading selected (only 75-410 will be shown).
# 
# 3. With the selected temperature reading, the predicted vapor pressure of mercury 
# reading will be shown below the graph.
#

library(shiny)

shinyUI(fluidPage(

    titlePanel("Predict Vapor Pressure of Mercury from Temperature (degree Celsius)"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderTemperature",
                        "Temperature:",
                        min = 0,
                        max = 500,
                        value = 10),
            checkboxInput('showModel', 'Show/Hide Model', value=TRUE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1"),
            h3('Predicted Vapor Pressure of Mercury:'),
            textOutput('pred')
        )
    )
))
