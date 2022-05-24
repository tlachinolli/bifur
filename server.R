#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define la lógica requerida para grafícar un retrato fase interactivo
shinyServer(function(input, output, session) {
    vZ <- -10:10
    dP <- expand.grid(vZ,vZ)
    
    output$retratoFase <- renderPlot({
        eps <- input$epsilon
        mA <- matrix(c(0, -2, 2, eps), 2, 2)
        dif <- mA %*% t(dP)
        dPAu <- cbind(dP, t(dif))
        colnames(dPAu) <- c("x","y","dx","dy")
        x <- dPAu$x
        y <- dPAu$y
        dx <- dPAu$dx
        dy <- dPAu$dy
        n <- sqrt(dx^2 + dy^2)
        par(pty="s") # establece gráfica cuadrada
        plot(x, y, pch = ".")
        arrows(x, y, x + dx/n, y + dy/n, length = 0.1, col = "steelblue")
    })
    
    output$tipo <- renderText({
        eps <- input$epsilon
        mA <- matrix(c(2,0 , -2, eps), 2, 2)
        delta <- det(mA)
        diagA <- diag(mA)
        tau <- sum(diagA)
        
        if( delta > 0 && tau^2-4*delta < 0 && tau != 0){
            tipo <- "foco en el origen"
            if(tau > 0){
                estabilidad <- "(inestable)"
            }else{estabilidad <- "(estable)"}
        }else
            if( delta > 0 && tau^2-4*delta >= 0){
                tipo <- "nodo en el origen"
                if(tau > 0){
                    estabilidad <- "(inestable)"
                }else{estabilidad <- "(estable)"}
        }else
            if(delta > 0 && tau == 0){
                tipo <- "centro en el origen"
                estabilidad <- ""
            }
        
        c(tipo, estabilidad)
        
    })

})
