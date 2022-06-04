# bifur

## Para qué usar

Esta aplicación pretende servir como material de apoyo para el tema de **Sistemas de Ecuaciones diferenciales** en R x R.

## Problema de Cauchy (condición inicial)

Para hallar la solución del problema de valor inicial o de Cauchy para un sistema de ecuaciones diferenciales.

## Teoría de bifurcación

Para aclarar el concepto de bifurcación en sistemas de ecuaciones diferenciales. Así como de estabilidad de un sistema.

En la siguiente imágen se muestran ejemplos de problemas para este tema.

![Ejemplos](/images/bifurcationTheroy.png)

## Cómo usar
bifur es una aplicación RShiny que permite ingresar los coeficientes de una matriz de 2 por 2, donde uno o más de estos coeficientes puede ser una variable epsilon.

El usuario puede hacer variar epsilon con ayuda de un slider o simplemente dandole clic al botón de play (ubicando debajo del slider a la derecha).

Se muestra el retrato fase correspondiente al sistema de ecuaciones diferenciales x'= Ax donde A es la matriz de 2 por 2 ingresada.

La aplicación nos da un análisis de la estabilidad del sistema en una oración corta, utilizando un análisis del plano delta-tau (ver siguiente Teorema).

![Delta Tau](/images/teoremaDeltaTau.png)

Para la matriz predeterminada (la misma que ejercicio 3 en imagen Ejemplos) podemos ver que: 

* Cuando epsilon es cero tenemos un centro.
* Para epsilon menor que cero tenemos retratos estables
* Para epsilon mayor a cero tenemos retratos inestables.

Lo anterior nos indica que epsilon igual a cero es un un punto de bifurcación del sistema.

Puedes obtener la solución al problema de valor inicial haciendo clic en el retrato fase en un punto deseado. Este punto se tomara como (x0, y0) para dar solución al problema. Se muestra la gráfica y la solución. La separación de los caracteres de graficado nos da información de la velocidad de una partícula en la solución. Se distingue con signos "-" y "+" los puntos con t negativo y t positivo, respectivamente.

### Próximamente
* Mostrar vectores coloreados con gradiente dependiendo de velocidad en dicho punto.
* Mostrar plano delta-tau y punto correspondiente a matriz.
