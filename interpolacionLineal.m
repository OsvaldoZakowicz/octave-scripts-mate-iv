% Interpolacion lineal


% Arrays de coordenadas

x=input('Ingrese las x: ');
y=input('Ingrese las y: ');

n = length(x);
puntoAInterpolar=input('Ingrese el punto a aproximar: ');

% Check if x and y arrays are equally large

if (length(x) ~= length(y))
	error ('.. The given x and y arrays are not equally large')
endif


if ( puntoAInterpolar <= x(1)) 
	if ( puntoAInterpolar >= x(end))
		error ('El punto a interpolar no se encuentra en el intervalo (a-b)')
    endif
endif


for i = 1 : n

	if (puntoAInterpolar < x(i))
		i1 = i-1; 
		i2 = i;
	elseif (puntoAInterpolar > x(i))
		i1 = i;
		i2 = i+1;
	endif


	valorEstimado = y(i1) + ((y(i2) - y(i1)) / (x(i2) - x(i1))) * (puntoAInterpolar - x(i1));
    disp(['estos son i1 e i2 : ' num2str(i1) ' ' num2str(i2)])
    disp(['f(' num2str(i) ') = ' num2str(valorEstimado)])
    

endfor

disp(['f(' num2str(puntoAInterpolar) ') = ' num2str(valorEstimado)])
