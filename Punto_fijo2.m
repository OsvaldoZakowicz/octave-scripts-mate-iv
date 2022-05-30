clc
clear all

%lectura de valores de entrada
xa=input('Por favor intruduzca una aproximacion incial:  ');
tolerancia=input('Por favor ingrese un valor para el maximo error permitido:  ');
niter=input('Por favor ingrese el numero maximo de iteraciones permitidas:  ');
fx=input('Por favor intruduzca la funcion a analizar entre comillas sencillas:  ');
gx=input('Por favor intruduzca la funcion generadora entre comillas sencillas:  ');

%Procesamiento de valores de entrada
f=inline(fx);
g=inline(gx);
yx=f(xa);

i=0;
error=tolerancia+1;

%Creaci�n de matriz con resultados parciales y final
resultado(1,1)=0;
resultado(1,2)=xa;
resultado(1,3)=yx;
resultado(i+1,4)=0;

%Estructura de procesamiento de las iteraciones
while yx!=0&error>tolerancia&i<niter,

  xn=g(xa);
  yx=f(xn);
  error=abs(xn-xa);

  resultado(i+2,1)=i+1;
  resultado(i+2,2)=xn;
  resultado(i+2,3)=yx;
  resultado(i+2,4)=error;

  xa=xn;
  i=i+1;

end

%Impresion de resultados
if yx==0,
  disp('     n          xn       f(xn)      error')
  disp(resultado)
  disp('***************************************************************************************')
  disp('El siguiente valor es raiz de la funcion: ')
  disp(xa)
  %break
end

if error<tolerancia,
  disp('     n          xn       f(xn)      error')
  disp(resultado)
  disp('***************************************************************************************')
  disp('El siguiente valor es aproximacion a la raiz de la funcion: ')
  disp(xa)
  disp('Con una tolerancia de: ')
  disp(tolerancia)
  %break
end

if i>=niter,
  disp('El metodo fracas? en las iteraciones programadas')
end
