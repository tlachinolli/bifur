# bifur

## Para qué usar

Esta aplicación pretende servir cómo material de apoyo para el tema de Teoría de Bifurcación. Se puede utilizar para aclarar el concepto de bifurcación.

En la siguiente imágen se muestran ejemplos de problemas para este tema.

![Ejemplos](/images/bifurcationTheroy.png)

## Cómo usar
bifur es una aplicación RShiny que permite ingresar los coeficientes de una matriz de 2 por 2, donde uno o más de estos coeficientes puede ser una variable epsilon.
A continuación se muestran 

El usuario puede hacer variar epsilon con ayuda de un slider o simplemente dandole clic al botón de play (ubicando debajo del slider a la derecha).


La aplicación nos da un análisis de la estabilidad del sistema en una oración corta, utilizando un análisis del espacio delta-tau (ver siguiente Teorema).

![Delta Tau](/images/teoremaDeltaTau.png)


Se muestra el retrato fase correspondiente al sistema de ecuaciones diferenciales x'= Ax donde A es la matriz de 2 por 2 ingresada.

Para la matriz predeterminada podemos ver que: 

* Cuando epsilon es cero tenemos un centro.
* Para epsilon menor que cero tenemos retratos estables
* Para epsilon mayor a cero tenemos retratos inestables.

Lo anterior nos indica que epsilon igual a cero es un un punto de bifurcación del sistema.

### Próximamente

* Mostrar solución del sistema en un punto (x0,y0) al dar clic en la gráfica en dicho punto.
