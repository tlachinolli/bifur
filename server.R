#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
source("functions.R")
# Define la lógica requerida para grafícar un retrato fase interactivo
shinyServer(function(input, output, session) {

    output$retratoFase <- renderPlot({
        eps <- input$epsilon
        a = input$a
        b = input$b
        c = input$c
        d = input$d
        a <- checkEpsi(a, eps)
        b <- checkEpsi(b, eps)
        c <- checkEpsi(c, eps)
        d <- checkEpsi(d, eps)
        dP <- createPortraitData(a, c, b, d)
        createPortrait(dP)
    })
    
    output$tipo <- renderText({
        eps <- input$epsilon
        a = input$a
        b = input$b
        c = input$c
        d = input$d
        a <- checkEpsi(a, eps)
        b <- checkEpsi(b, eps)
        c <- checkEpsi(c, eps)
        d <- checkEpsi(d, eps)
        analyseStability(a, c, b, d)
    })

})
