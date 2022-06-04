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
        values$x0 <- input$condIni$x
        values$y0 <- input$condIni$y
    })
    
    output$retratoFase <- renderPlot({
        dP <- createPortraitData(values$a, values$c, values$b, values$d)
        createPortrait(dP)
    })
    
    output$tipo <- renderText({
        analyseStability(values$a, values$c, values$b, values$d)
    })

    output$solCauchy <- renderUI({
        req(values$x0, values$y0)
        solveCauchy(values$a, values$c, values$b, values$d, values$x0, values$y0)
    })
    
    output$solCauchyPlot <- renderPlot({
        req(values$x0, values$y0)
        plotCauchy(values$a, values$c, values$b, values$d, values$x0, values$y0)
    })
    
    observeEvent(input$navbar,{
        if(input$navbar == "yt"){
            browseURL("https://www.youtube.com/channel/UCjXp8McnqgUD-oCA8CHnUlg")
        }else
        if(input$navbar == "li"){
            browseURL("https://www.linkedin.com/in/atila-orlov/")
        }else
        if(input$navbar == "gh"){
                browseURL("https://github.com/tlachinolli/bifur")
        } 
        if(input$navbar != "info"){
            updateTabsetPanel(session, "navbar", selected = "App") # not the best way I think but... eehh
        }
    })
})
