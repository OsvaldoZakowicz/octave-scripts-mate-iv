## Copyright (C) 2013 user
##
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## ashort with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## SOR

## Author: user <user@VALENTINA>
## Created: 2013-04-15

%Método iterativo SOR

%Borrar lo que haya en pantalla y mostrar el nombre del método:
clc
clear all
format long
fprintf('                             METODO DE GAUSS SEIDEL CON RELAJACION (SOR)\n\n  ')


fprintf('Datos iniciales\n')
A=input('Ingresar la matriz A: ');
B=input('Ingresar vector de terminos independientes B: ');
n=length(B);
x=input('Ingresar el vector con las aproximaciones iniciales: ');
w=input('Ingresar el factor de relajacion: ');
iter=input('Ingresar el numero maximo de iteraciones: ');
tol=input('Ingresar la tolerancia: ');

%Matrices requeridas para la fórmula A=D-L-U (forma matricial de los métodos iterativos)
d=diag(diag(A)); %Matriz diagonal
l=d-tril(A); %Matriz triangular inferior con miembros de diagonal igual a cero
u=d-triu(A);  %Matriz triangular superior con miembros de diagonal igual a cero
T=(d-w*l)^-1*((1-w)*d+w*u); %Matriz de iteración de SOR
re=max(abs(eig(T))) %Radio espectral; eig toma los valores propios

disp('L');
disp(l)
disp('U');
disp(u)
disp('D');
disp(d)
disp('Tsor');
disp(T)

%El método converge si y solo si re<1
if re>1
    disp('El Radio Espectral es mayor que 1')
    disp('El metodo no converge')
    %break
end

C=w*(d-w*l)^-1*B %Vector de iterción de SOR

disp('Csor');
disp(C)

i=0;
error=tol+1;
z=[i,x(1),x(2),x(3),error];
while error>tol && i<iter %Si esto se cumple las iteraciones continúan

    xi=T*x+C; %Fórmula general: me da el vector, no sus componentes
    i=i+1;
    error=norm(xi-x);
    x=xi;
    z(i+1,1)=i;
    z(i+1,2)=x(1);
    z(i+1,3)=x(2);
    z(i+1,4)=x(3);
	%z(i+1,5)=x(4);
	%z(i+1,6)=x(5);
    z(i+1,7)=error;

end

fprintf('\nSe encontro la siguiente solucion, en %g iteraciones con un error de %g:\n\n',i,error)
for in=1:n
    fprintf('X%g=%g\n',in,xi(in))
end
fprintf('\nTabla de iteraciones:\n\n')
fprintf('\n  Iteraciones    x(1)     x(2)      x(3)      x(4)      x(5)      Error\n\n')
disp(z)
