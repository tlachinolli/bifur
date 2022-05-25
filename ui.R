# bifur
# tltltl
# tltl
# tl
#       tlachinolliatl@gmail.com
#########################
library(shiny)

# Interfaz de usuario para aplicación que grafíca retratos fase de matrices 2x2
# con coeficientes constantes entre -10:10 o con la variable epsilon.
# el valor de la variable epsilon se modifica mediante un slider
# de manera que se puedan visualizar las bifurcaciones
# Puede utilizarse como material didáctico en cursos de Ecuaciones Diferenciales
#####

shinyUI(fluidPage(

    # Application title
    titlePanel("Visualizador de bifurcaciones"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            fluidRow(
                column(6,
                    selectInput("a", "a", # input id, label
                    choices = c(-10:10, "\u03B5"="eps"), selected = 0)
                ),
                column(6,
                    selectInput("b", "b", 
                    choices = c(-10:10, "\u03B5"="eps"), selected = 2) 
                )
            ),
            fluidRow(
                column(6,
                    selectInput("c", "c", 
                    choices = c(-10:10, "\u03B5"="eps"), selected = -2) 
                ),
                column(6,
                    selectInput("d", "d", 
                    choices = c(-10:10, "\u03B5"="eps"), selected = "eps") 
                )
            ),
            sliderInput("epsilon",
                        "valor de \u03B5:",
                        min = -5,
                        max = 5,
                        value = -5,
                        step = 0.5,
                        animate = T
                        )
        ),

        # Muestra retrato fase del sistema y análisis de estabilidad
        mainPanel(
            plotOutput("retratoFase"),
            textOutput("tipo")
        )
    )
))
