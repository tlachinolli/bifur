# bifur
# tltltl
# tltl
# tl
#       tlachinolliatl@gmail.com
#########################
# phase portrait ploter functions

# función que recibe coeficientes y crea dataframe
# de red de puntos junto con sus diferenciales así como norma
createPortraitData <- function(a, c, b, d){
  vCoef <- c(a, c, b, d)  
  mA <- matrix(vCoef, 2, 2)
  vZ <- -10:10
  dPortraitData <- expand.grid(vZ,vZ)
  dif <- mA %*% t(dPortraitData)
  dPortraitData <- cbind(dPortraitData, t(dif))
  n <- sqrt(dPortraitData[,3]^2 + dPortraitData[,4]^2)
  dPortraitData <- cbind(dPortraitData, n)
  colnames(dPortraitData) <- c("x","y","dx","dy","n")
  dPortraitData
}

# Función que recibe dataframe regresado por createPortraitData y grafica retrato fase del sistema
createPortrait <- function(dPortraitData){
  x <- dPortraitData$x
  y <- dPortraitData$y
  dx <- dPortraitData$dx
  dy <- dPortraitData$dy
  n <- dPortraitData$n
  par(pty="s") # establece gráfica cuadrada
  plot(x, y, pch = ".")
  arrows(x, y, x + dx/n, y + dy/n, length = 0.1, col = "steelblue")
}
# Función que recibe coeficientes y regresa análisis de estabilidad en una oración corta
analyseStability <- function(a, c, b, d){
  mA <- matrix(c(a, c, b, d), 2, 2)
  delta <- det(mA)
  diagA <- diag(mA)
  tau <- sum(diagA)
  tipo <- ""
  estabilidad <- ""
  if(delta == 0){
    tipo <- "espacio degenerado"
  }else
  if(delta < 0){
    tipo <- "punto silla en el origen" 
    estabilidad <- "(inestable)"
  }else
  if(delta > 0 && tau^2-4*delta < 0 && tau != 0){
    tipo <- "foco en el origen"
    if(tau > 0){
        estabilidad <- "(inestable)"
      }else{estabilidad <- "(estable)"}
  }else
  if(delta > 0 && tau^2-4*delta >= 0){
      tipo <- "nodo en el origen"
      if(tau > 0){
        estabilidad <- "(inestable)"
      }else{estabilidad <- "(estable)"}
  }else
  if(delta > 0 && tau == 0){
      tipo <- "centro en el origen (periódica)"
  }
  c(tipo, estabilidad)
}
# Función que recibe coeficiente y epsilon y regresa coeficiente o epsilon
# dependiendo si está elegido epsilon o no
checkEpsi <- function(selectedInput, epsilon){
  if(selectedInput == "eps"){
    a <- as.double(epsilon)
  }else{a <- as.integer(selectedInput)}
}