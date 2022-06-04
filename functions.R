# bifur
# tltltl
# tltl
# tl
#       tlachinolliatl@gmail.com
#########################
# phase portrait plotter functions

# función que recibe coeficientes y crea dataframe
# de red de puntos junto con sus diferenciales así como norma
createPortraitData <- function(a, c, b, d){
  vCoef <- c(a, c, b, d)  
  mA <- matrix(vCoef, 2, 2)
  vZ <- -10:10
  dPortraitData <- expand.grid(vZ,vZ)
  dif <- mA %*% t(dPortraitData)
  dPortraitData <- cbind(dPortraitData, t(dif))
  n <- sqrt(dPortraitData[, 3] ^ 2 + dPortraitData[, 4] ^ 2)
  dPortraitData <- cbind(dPortraitData, n)
  colnames(dPortraitData) <- c("x", "y", "dx", "dy", "n")
  dPortraitData
}
# Función que recibe dataframe regresado por createPortraitData y grafica retrato fase del sistema
createPortrait <- function(dPortraitData){
  x <- dPortraitData$x
  y <- dPortraitData$y
  dx <- dPortraitData$dx
  dy <- dPortraitData$dy
  n <- dPortraitData$n
  par(pty="s", bg = "#303030") # establece gráfica cuadrada y color del theme darkly
  plot(x, y, pch = ".", axes = F, col = "#3498db", col.lab = "white")
  box(col = 'white')
  axis(1, col = 'white', col.axis = 'white', col.ticks = 'white')
  axis(2, col = 'white', col.axis = 'white', col.ticks = 'white')
  arrows(x, y, x + dx/n, y + dy/n, length = 0.1, col = "#00bc8c")
}

# Función que recibe coeficientes de matriz A así como un punto (x,y) envíado por usuario
# mediante un clic en retrato fase -> y despliega la solución al problema de Cauchy con condicion inicial ese punto (x,y)
# en formato LaTeX
####
solveCauchy <- function(a, c, b, d, x0, y0){
  mA <- matrix(c(a, c, b, d), 2, 2)
  l1 <- eigen(mA)$values[1]
  l2 <- eigen(mA)$values[2]
  if(l1 == l2){p("Lo sentimos, las soluciones para eigenvalores múltiples no están disponibles en la versión de prueba...", style = "color:#f39c12")}
  else{
    v1 <- eigen(mA)$vectors[, 1]
    v2 <- eigen(mA)$vectors[, 2]
    mC <- matrix(c(v1[1], v1[2], v2[1], v2[2]), 2, 2)
    mB <- c(x0, y0)
    vC <- solve(mC, mB)
    c1 <- vC[1]
    c2 <- vC[2]
    withMathJax(
      sprintf("$$X(t) = (%s)\\, e ^ {%s t} \\begin{pmatrix} %s \\\\ %s \\end{pmatrix}
                        + (%s)\\, e ^ {%s t} \\begin{pmatrix} %s \\\\ %s \\end{pmatrix}
                        $$",
              round(c1,2), round(l1,2), round(v1[1],2), round(v1[2],2), round(c2,2), round(l2,2),round(v2[1],2), round(v2[2],2)
      ))
  }
}
# Función que recibe coeficientes de matriz A así como un punto (x,y) envíado por usuario
# mediante un clic en retrato fase -> y regresa la gráfica de la solución de Cauchy por ese punto
####
plotCauchy <- function(a, c, b, d, x0, y0){
  mA <- matrix(c(a, c, b, d), 2, 2)
  l1 <- eigen(mA)$values[1]
  l2 <- eigen(mA)$values[2]
  req(l1 != l2)
  req(x0, y0)
  v1 <- eigen(mA)$vectors[, 1]
  v2 <- eigen(mA)$vectors[, 2]
  mC <- matrix(c(v1[1], v1[2], v2[1], v2[2]), 2, 2)
  mB <- c(x0, y0)
  vC <- solve(mC, mB)
  c1 <- vC[1]
  c2 <- vC[2]
  t <- seq(-5, 5, 0.1)
  mf <- c1 * (exp(l1 * t) %*% t(v1)) + c2 * (exp(l2 * t) %*% t (v2))
  colnames(mf) <- c("x", "y")
  df <- as.data.frame(mf)
  par(pty="s", bg = "#303030") # establece gráfica cuadrada y color del theme darkly
  plot(df, xlim = c(-10, 10), ylim = c(-10, 10), pch = ifelse(t >= 0, "+","-" ), axes = F, col = "#3498db", col.lab = "white")
  box(col = 'white')
  axis(1, col = 'white', col.axis = 'white', col.ticks = 'white')
  axis(2, col = 'white', col.axis = 'white', col.ticks = 'white')
}

# Función que recibe coeficientes de matriz A y regresa análisis de estabilidad en una oración corta
#### Hay que optimizar
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
  if(delta > 0 && (tau ^ 2) - (4 * delta) >= 0){
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