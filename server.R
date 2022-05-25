# bifur
# tltltl
# tltl
# tl
#       tlachinolliatl@gmail.com
#########################
library(shiny)
source("functions.R")
# Define la lógica requerida para graficar un retrato fase interactivo
shinyServer(function(input, output, session) {
    values <- reactiveValues()  
    observe(
        {
        values$a <-  checkEpsi(input$a, input$epsilon)
        values$b <-  checkEpsi(input$b, input$epsilon)
        values$c <-  checkEpsi(input$c, input$epsilon)
        values$d <-  checkEpsi(input$d, input$epsilon)
        }
        ) 

    output$retratoFase <- renderPlot({
        dP <- createPortraitData(values$a, values$c, values$b, values$d)
        createPortrait(dP)
    })
    
    output$tipo <- renderText({
        analyseStability(values$a, values$c, values$b, values$d)
    })

})
