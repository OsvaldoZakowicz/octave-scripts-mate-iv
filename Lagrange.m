%POLINOMIO INTERPOLANTE DE LAGRANGE
disp('POLINOMIO INTERPOLANTE DE LAGRANGE')
xi=input('Ingrese las x: ');
yi=input('Ingrese las y: ');
n=length(xi);
x=sym('x');
for j=1:n
  pr1=1;
  for i=1:j-1
    pr1=pr1*(x-xi(i));
  endfor
    pr2=1;
    for i=j+1:n
    pr2=pr2*(x-xi(i));
    endfor
    pr3=1;
    for i=1:j-1
        pr3=pr3*(xi(j)-xi(i));
    endfor
    pr4=1;
    for i=j+1:n
        pr4=pr4*(xi(j)-xi(i));
    endfor
    L(j)=(pr1*pr2)/(pr3*pr4);
    fprintf('\n L%d:\n',j-1)
    disp(L(j))
endfor
Pn=0;
for j=1:n
    Pn=Pn+L(j)*yi(j);
endfor
disp('Polinomio Interpolante:')
disp(Pn)
opc=input('Desea aproximar un valor (si/no): ','s');
if opc=='si'
    x=input('Ingrese el punto a aproximar: ');
    y=eval(Pn);
    disp('La aproximacion a f(x) es:')
  disp(y) 
endif
