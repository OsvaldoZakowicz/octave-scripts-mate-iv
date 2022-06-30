function metgausseidel(A,b,x,tol,m)
n=length(x);
for k=1:m
    w=x;
    for i=1:n
        s=A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x(i+1:n);
        x(i)=(b(i)-s)/A(i,i);
    end
    if norm(x-w,inf)<tol
        return
    end
    fprintf('\n la solucion del sistema en la iteraci�n %4.0f\n',k)
    for i=1:n
        fprintf('          x(%1.0f)=%6.8f\n',i,x(i))
    end
end

%ejemplo para compilar
    %5x -3y +1z = 5
    %2x +4y -1z = 6
    %2x -3y +8z = 4

%>> A=[5 -3 1;2 4 -1;2 -3 8];
%>> b=[5 6 4]';
%>> x=[1 1 1]';
%>> tol=0.0001;
%>> m=20;
%>> metgausseidel(A,b,x,tol,m)
