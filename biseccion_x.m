## Copyright (C) 2022 Zakowicz Osvaldo
## Author: Zakowicz Osvaldo <osvaldo@osvaldoz>
## Created: 2022-04-26

## PARAMETROS:
# funcion: una funcion predefinida de forma anonima, de un solo parametro.
# a: extremo inferior del intervalo de busqueda.
# b: extremo superior del intervalo de busuqeda.
# minimo_error: tolerancia de error minima deseada, ejemplo: 0.1, 0.01, 0.001 ...
# max_iteraciones: cantiad de iteraciones maximas deseadas

function [] = biseccion_x (funcion,a,b,minimo_error,max_iteraciones)
  test_signo = funcion(a)*funcion(b);
  #si la comprobacion f(a).f(b)<0 el intervalo es correcto para iniciar.
  if(test_signo>0)
    error('intervalo de inicio incorrecto, se debe cumplir f(a).f(b)<0 para empezar!');
  end;
  #antes de comenzar a iterar, p = a, mas que nada para definir p_anterior luego
  p = a;
  #iterar
  iteraciones = 0;
  while(1)
    #p anterior se toma antes de calcular el valor de p inicial
    p_anterior = p;
    #p inicial, valor medio del intervalo
    p = (a+b)/2;
    #error relativo
    error_relativo = abs((p-p_anterior)/p)*100;
    #comprobar signo entre p y un extremo
    test_signo = funcion(a)*funcion(p);
    if(test_signo<0)
      #a y p tienen singos distintos
      b = p;
      disp('----------valor b:---------- ')
      disp(b)
      disp('# iteracion: ')
      disp(iteraciones)
    elseif(test_signo>0)
      #a y p tienen el mismo signo
      a = p;
      disp('----------valor a:---------- ')
      disp(a)
      disp('# iteracion: ')
      disp(iteraciones)
    else
      disp('cero')
    end
    
    iteraciones = iteraciones + 1;
    #romper bucle al llegar al minimo error indicado o cuando llego al maximo
    #de iteraciones indicadas
    if(error_relativo <= minimo_error || iteraciones >= max_iteraciones)
      disp('*****RESULTADO POR BISECCION*********')
      disp('RAIZ APROXIMADA: ')
      disp(p)
      disp('***************FIN*******************')
      break;
    end
  end
endfunction
