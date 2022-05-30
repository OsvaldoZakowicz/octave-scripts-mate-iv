 %Metodo De Punto Fijo
disp('METODO :  DE : PUNTO : FIJO');
disp('  ');
format long
Xo=input('ingrese el valor inicial: ');
Iter=input('ingrese el numero de iteraciones: ');
Tol=input('ingrese la tolerancia deseada: ');
Fun=input('Indique la funcion entre comillas: ');
G=input('ingrese la funcion despejada entre comillas = ','s');
f=inline(Fun);
g=inline(G);
Y1=f(Xo);
if Y1==0
    fprintf('Xo es raiz: ');
else
    Error=Tol+1;
    Cont=0;
    A=[Cont,Xo,Y1,Error];
    while Y1~=0 & Error>Tol & Cont<Iter  
        X1=g(Xo);                        
        Y1=f(X1);                        
        Error=abs((X1-Xo)/X1);           
        Cont=Cont+1;                   
        A(Cont,1)=Cont;                  
        A(Cont,2)=Xo;                    
        A(Cont,3)=X1;                    
        A(Cont,4)=Y1;                    
        A(Cont,5)=Error;                
        Xo=X1;                           
    end
    if Y1==0
        fprintf('X1 es raiz: ');
    else
        if Error<Tol
            fprintf('La raiz es %g con un error de %g: ',X1,Error);
        else
            fprintf('numero maximo de Iteraciones: ');
        end
    end
    fprintf(' Xo,         X1,         Y1,         Error: ')
    disp(A)
end