clc

clear all

%Lectura de valores iniciales

x0=input('Ingrese el valor del primer valor inicial: ');

x1=input('Ingrese el valor del segundo valor inicial: ');

tol=input('Ingrese el valor para el maximo valor de error permitido: ');

niter=input('Ingrese el numero maximo de iteraciones para hacer el analisis: ');

fx=input('Ingrese la funcion a analizar entre comillas simples: ');

f=inline(fx);

%Procesamiento inicial de datos

y0=f(x0);

%Validación inicial

if y0==0,

disp('El valor inicial es una raiz')

%break

end

y1=f(x1);

i=0;

error=tol+1;

den=y1-y0;

%Creacion de matriz de resultados parciales y finales

resultado(1,1)=0;

resultado(1,2)=x0;

resultado(1,3)=y0;

resultado(1,4)=0;

resultado(2,1)=1;

resultado(2,2)=x1;

resultado(2,3)=y1;

resultado(2,4)=0;

%Estructura procesadora de iteraciones

while error>tol&y1!=0&den!=0&i<niter,

x2=x1-y1*((x1-x0)/den);

error=abs(x2-x1);

x0=x1;

y0=f(x1);

x1=x2;

y1=f(x1);

resultado(i+3,1)=i+2;

resultado(i+3,2)=x1;

resultado(i+3,3)=y1;

resultado(i+3,4)=error;

den=y1-y0;

i=i+1;

end

%Impresión de resultados

if y1==0,

disp(' n xi f(x) error')

disp(resultado)

disp('************************************************************************************')

disp('El siguiente valor es una raiz de la funcion estudiada:')

disp(x1)

%break

end

if error<tol,

disp(' n xi f(x) error')

disp(resultado)

disp('************************************************************************************')

disp('El siguiente valor es una aproximacion a una raiz de la funcion estudiada:')

disp(x1)

disp('Con una tolerancia de:')

disp(tol)

%break

end

if den=0,

disp('Hay una posible raiz multiple')

%break

end

if i>=niter,

disp('No se encontraron raices en el numero de iteraciones establecido')

end
