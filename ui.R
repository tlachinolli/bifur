# bifur
# tltltl
# tltl
# tl
#       tlachinolliatl@gmail.com
#########################
library(shiny)
library(shinythemes)

# Interfaz de usuario para aplicación que grafíca retratos fase de matrices 2x2
# con coeficientes constantes entre -12:12 o con la variable epsilon.
# el valor de la variable epsilon se modifica mediante un slider
# de manera que se puedan visualizar las bifurcaciones
# Puede utilizarse como material didáctico en cursos de Ecuaciones Diferenciales
# También da la solución al problema de valor inicial o de Cauchy para el sistema
# recibiendo como condición inicial el punto (x,y) cliqueado por usuario en retrato fase
#
#####

shinyUI(fluidPage( 
    title="Bifur",
    withMathJax(),
    theme = shinytheme("darkly"),
    # Application title
    navbarPage("bifur", id = "navbar",
               tabPanel("App",  icon = icon("mug-hot"),
                        titlePanel(h3("Análisis de Sistemas de Ecuaciones Diferenciales en R2") ),
                        
    sidebarLayout(
        sidebarPanel( width = 3,
            h3("Seleccionar coeficientes de la matriz"),
            p("(La variable \u03B5 se hace variar mediante el deslizador ubicado en la parte inferior)"),
            # select input para coeficientes de matriz A y slider para epsilon
            ##########
            fluidRow(
                column(4,
                    h2(style="text-align: center;", "A = ")
                ),
                column(4,
                    selectInput("a", "a", # input id, label
                    choices = c(-12:12, "\u03B5"="eps"), selected = 0)
                ),
                column(4,
                    selectInput("b", "b", 
                    choices = c(-12:12, "\u03B5"="eps"), selected = 2) 
                )
            ),
            fluidRow(
                column(4,
                    
                ),
                column(4,
                    selectInput("c", "c", 
                    choices = c(-12:12, "\u03B5"="eps"), selected = -2) 
                ),
                column(4,
                    selectInput("d", "d", 
                    choices = c(-12:12, "\u03B5"="eps"), selected = "eps") 
                )
            ),
            h3("Deslizador de variable \u03B5"),
            p("(útil para analizar bifurcaciones)"),
            sliderInput("epsilon",
                        "valor de \u03B5:",
                        min = -5,
                        max = 5,
                        value = -5,
                        step = 0.5,
                        animate = T
                        )
        ),

        mainPanel( width = 9,
            # Encabezados para plots
            div( style = "background-color:#303030",
            fluidRow(
                column(6,
                       h3("Retrato fase"),
                       p("Estabilidad:"),
                       textOutput("tipo")
                ),
                column(6,
                       h3("Solución a problema de Cauchy"),
                       p("Dar clic en retrato fase para elegir condición inicial")
                       
                )
            ),
            # Plots
            fluidRow(
                column(6,
                       plotOutput("retratoFase", click = "condIni")
                ),
                column(6,
                       plotOutput("solCauchyPlot")
                )
            )
        ), #div end  
        # solucion a problema de condición inicial (Cauchy)
    uiOutput('solCauchy')
    )#main Panel end
        
    )
    ), # fin de tab
    tabPanel("Mi Canal", icon = icon("youtube"), value = "yt"),
    tabPanel("Mi Perfil", icon = icon("linkedin"), value = "li"),
    tabPanel("Código Fuente", icon = icon("github"), value = "gh"),
    tabPanel("Info", icon = icon("info"), value = "info",
             div(
                 h4("Autor:"),
                 p("Atila Orlov (tlachinolli)"),
                 p("tlachinolliatl@gmail.com"),
                 br(),
                 h4("Referencias:"),
                 p("Perko, L. (2001) Differential Equations
          and Dynamical Systems. 3rd Edition,
          Springer-Verlag.
          https://doi.org/10.1007/978-1-4613-0003-8"),
                 br(),
                 citation(),
                 br(),
                 br(),
                 p("Winston Chang, Joe Cheng, JJ
          Allaire, Carson Sievert, Barret
          Schloerke, Yihui Xie, Jeff
          Allen, Jonathan McPherson, Alan
          Dipert and Barbara Borges
          (2021). shiny: Web Application
          Framework for R. R package
          version 1.7.1.
          https://CRAN.R-project.org/package=shiny"
                 ),
                 
                 style = "background-color:#303030"
             )
             
    )
) # fin de navbar


))
