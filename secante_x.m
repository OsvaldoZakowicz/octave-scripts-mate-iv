## Copyright (C) 2022 Zakowicz Osvaldo
## Author: Zakowicz Osvaldo <osvaldo@osvaldoz>
## Created: 2022-04-27
## Script de catedra editado.

## METODO DE LA SECANTE, variacion del metodo de newton.
# PARAMETROS:
# funcion: una funcion predefinida de forma anonima, de un solo parametro.
# x0 y x1: parametros de x que seran las aproximaciones de arranque, secante inicial.
# minimo_error: tolerancia de error minima deseada, ejemplo: 0.1, 0.01, 0.001

function [] = secante_x (funcion, x0, x1, minimo_error)
  error = 100;
  n = 0;
  #cabecera de la tabla de resultados
  fprintf('|n |xi         |xi+1       |xi+2       |error      |\n')
  #fprintf('      %i    |  %9.9f    |    %9.9f  |     -     |      -        |\n',n,x0,x1);
  #iterar para completar la tabla
  while(error>minimo_error)
    #formula a repetir
    x2 = x1 - (((funcion(x1))*(x1-x0))/((funcion(x1))-(funcion(x0))));
    #acotar error
    error = abs(funcion(x2));
    #fila i-esima calculada
    fprintf('|%i |%9.9f|%9.9f|%9.9f|%9.9f|\n',n,x0,x1,x2,error);
    #ajustar variables
    x0=x1;
    x1=x2;
    n=n+1;
  end
endfunction
