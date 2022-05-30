# OctaveScriptsMateIV
Scripts de cada metodo de resolucion usado en matematica IV

## Script: método de biseccion:

*Formato de entrada:*

`biseccion_x (funcion,a,b,minimo_error,max_iteraciones)`

*parámetros*
- funcion: una funcion predefinida de forma anonima, de un solo parametro.
- a: extremo inferior del intervalo de busqueda.
- b: extremo superior del intervalo de busqueda.
- minimo_error: tolerancia de error minima deseada, ejemplo: 0.1, 0.01, 0.001 ...
- max_iteraciones: cantiad de iteraciones maximas deseadas

NOTA: definir una funcion anonima en octave.
``` 
variable = @(param1, param2, ... ,paramN) expresion_funcion
>> fn = @(x) x*(e^x)-1;
```
**Ejemplo de biseccion:**
```
>> fn = @(x) x*(e^x)-1;
>> biseccion_x(fn,0,1,0.05,10)
```