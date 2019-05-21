function [iteracionesM] = juliaSet(x,y,c,k)
%juliaSet produce el conjunto de julia para los siguientes parametros:
%   x : La cantidad de puntos entre -2 y 2 en el eje real.
%   y : La cantidad de puntos entre -2 y 2 en el eje complejo.
%   c : la constante sobre la cual se aplicará la iteración.
%   k : la cantidad de iteraciones antes de decidir si determinado un numero 
%       z en los complejos se encuentra en el conjunto.

    xRange = linspace(0,2,x*0.5);
    yRange = linspace(-2,2,y);
    iteracionesM=zeros(y,x);

    tic
    for i=1:length(xRange)
        for j=1:length(yRange)
            n=0;
            fn=complex(xRange(i),yRange(j));
            while(abs(fn)<=2 && n<k)
                n=n+1;
                fn=(fn^2)+c;
            end
            iteracionesM(y-j+1,i+(x*0.5))=n;
            iteracionesM(j,(x*0.5)-i+1)=n;
        end
    end
    %fractalFig = image(iteracionesM,'CDataMapping','scaled');
    %colormap hot
    %nombre = strcat('julia',num2str(c),'.pdf');
    %saveas(fractalFig,nombre)
    toc
end

