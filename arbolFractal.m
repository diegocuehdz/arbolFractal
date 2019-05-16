%Dibuja un arbol fractal en un Figure con base en los parametros dados.
%Input:
%   - angulo(radianes) - el ángulo con el que se van a rotar las ramas del árbol
%   - r(float) - la longitud de la rama inicial, a partir de esta se van a achicar
%          las siguientes ramas
%   - numIteraciones(Int) - cuantas veces se va a llamar recursivamente las
%                       funciones que auxiliares que dibujan las ramas
%Output: void

function arbolFractal(angulo, r, numIteraciones)    
    x0 = 0;
    y0 = 0;
    y1 = y0 + r;
    x1 = x0;
    plot([x0 x1],[y0 y1], "black");
    title("Árbol fractal con " + numIteraciones + " generaciones de ramas");

    
    axis equal
    axis off
    
    hold on
    
        ramaDerecha(x0, y0, x1, y1, angulo, r, numIteraciones);
        ramaIzquierda(x0, y0, x1, y1, angulo, r, numIteraciones);
    
    hold off
end


function ramaIzquierda(x1, y1, x2, y2, angulo, r, numIteraciones)

    if numIteraciones > 1
        
        matrizRotacionIzq = [cos(-angulo) sin(-angulo);
                            -sin(-angulo) cos(-angulo)];
       
        difVec = [x2-x1;
                  y2-y1];
        
        vecRotado = (matrizRotacionIzq * difVec) * 0.667;
        
        endpoint2 = [x2;
                     y2];
        
        nuevoOrigen = vecRotado + endpoint2;
        
        x1 = nuevoOrigen(1);
        y1 = nuevoOrigen(2);
        plot([x2 x1],[y2 y1], "black") 
        
        ramaDerecha(x2, y2, x1, y1, angulo, r, numIteraciones - 1);
        ramaIzquierda(x2, y2, x1, y1, angulo, r, numIteraciones - 1);
    end
    
end


function ramaDerecha(x1, y1, x2, y2, angulo, r, numIteraciones) 
    
    if numIteraciones > 1
    
        matrizRotacionDer = [cos(angulo) sin(angulo);
                            -sin(angulo) cos(angulo)];    

        difVec = [x2-x1;
                y2-y1]; 
    
        vecRotado = (matrizRotacionDer * difVec) * 0.667; 
        
        endpoint2 = [x2;
                     y2];
                 
        nuevoOrigen = vecRotado + endpoint2;
        
        x1 = nuevoOrigen(1); 
        y1 = nuevoOrigen(2); 
        
        plot([x2 x1],[y2 y1], "black")
        
        ramaDerecha(x2, y2, x1, y1, angulo, r, numIteraciones - 1);
        ramaIzquierda(x2, y2, x1, y1, angulo, r, numIteraciones - 1); 
    end
end