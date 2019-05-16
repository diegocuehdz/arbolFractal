%trianguloSierpinksy: Dibuja el fractal del triángulo de Sierpinsky
%Input:
%       - numIteraciones(Int) - cuantas veces se va a llamar la recusión
%Output: void
function trianguloSierpinsky(numIteraciones)
    
    X = [0; 0];
    Y = [10; 0];
    Z = [5; 10];
    hold on;
        plot([X(1) Y(1)],[X(2) Y(2)], "black");
        plot([X(1) Z(1)],[X(2) Z(2)], "black");
        plot([Z(1) Y(1)],[Z(2) Y(2)], "black");
        title("Triángulo de Sierpinsky con " + numIteraciones + " iteraciones");
       
        axis off
        
        drawSubTriangles(X, Y, Z, (numIteraciones - 1));
        
    hold off;
   
end

function drawSubTriangles(X, Y, Z, numIteraciones)

    if numIteraciones >= 0
        
        midPointXY = [(Y(1) + X(1))/2; (Y(2) + X(2))/2];
        midPointXZ = [(Z(1) + X(1))/2; (Z(2) + X(2))/2];
        midPointYZ = [((Y(1) + Z(1))/2); (Z(2) + Y(2))/2];    
        
        plot([midPointXY(1) midPointXZ(1)], [midPointXY(2) midPointXZ(2)], "black");
        plot([midPointYZ(1) midPointXY(1)], [midPointYZ(2) midPointXY(2)], "black");
        plot([midPointYZ(1) midPointXZ(1)], [midPointYZ(2) midPointXZ(2)], "black");
        
        drawSubTriangles(X, midPointXZ, midPointXY, (numIteraciones - 1));
        drawSubTriangles(midPointXZ, Z, midPointYZ, (numIteraciones - 1));
        drawSubTriangles(midPointXY, midPointYZ, Y, (numIteraciones - 1));        
    end
end

