%trianguloSierpinksy: Dibuja el fractal del tapete de Sierpinsky
%Input:
%       - numIteraciones(Int) - cuantas veces se va a llamar la recusión
%Output: void
function tapeteSierpinsky(numIteraciones)
    
    W_Inicial = [0; 0];
    X_Inicial = [0; 10];
    Y_Inicial = [10; 10];
    Z_Inicial = [10; 0];
    hold on
        plot([W_Inicial(1) X_Inicial(1)], [W_Inicial(2) X_Inicial(2)], "black");
        plot([X_Inicial(1) Y_Inicial(1)], [X_Inicial(2) Y_Inicial(2)], "black");
        plot([Y_Inicial(1) Z_Inicial(1)], [Y_Inicial(2) Z_Inicial(2)], "black");
        plot([Z_Inicial(1) W_Inicial(1)], [Z_Inicial(2) W_Inicial(2)], "black");
        
        title("Tapete de Sierpinsky con " + numIteraciones + " iteraciones");
        
        axis off
        axis equal
        
        drawSubSquares(W_Inicial, X_Inicial, Y_Inicial, Z_Inicial, (numIteraciones - 1))
        
    hold off
end

function drawSubSquares(W_Inicial, X_Inicial, Y_Inicial, Z_Inicial, numIteraciones)

    if (numIteraciones > 0)
        
        razon = sqrt((W_Inicial(1) - X_Inicial(1))^2 + (W_Inicial(2) - X_Inicial(2))^2)/3;
        
        W_SubSquare = [W_Inicial(1) + razon; W_Inicial(2) + razon];        
        X_SubSquare = [X_Inicial(1) + razon; X_Inicial(2) - razon];
        Y_SubSquare = [Y_Inicial(1) - razon; Y_Inicial(2) - razon];
        Z_SubSquare = [Z_Inicial(1) - razon; Z_Inicial(2) + razon];
       
        plot([W_SubSquare(1) X_SubSquare(1)], [W_SubSquare(2) X_SubSquare(2)], "black");
        plot([X_SubSquare(1) Y_SubSquare(1)], [X_SubSquare(2) Y_SubSquare(2)], "black");
        plot([Y_SubSquare(1) Z_SubSquare(1)], [Y_SubSquare(2) Z_SubSquare(2)], "black");
        plot([Z_SubSquare(1) W_SubSquare(1)], [Z_SubSquare(2) W_SubSquare(2)], "black");
        
        drawSubSquares(W_Inicial, [W_Inicial(1); W_Inicial(2) + razon], W_SubSquare, [W_Inicial(1) + razon; W_Inicial(2)], (numIteraciones - 1));
        drawSubSquares([W_Inicial(1); W_Inicial(2) + razon], [W_Inicial(1); W_Inicial(2) + 2*razon], X_SubSquare, W_SubSquare, (numIteraciones - 1));
        
        drawSubSquares([X_Inicial(1); X_Inicial(2) - razon], X_Inicial, [X_Inicial(1) + razon; X_Inicial(2)], X_SubSquare, (numIteraciones - 1));
        drawSubSquares(X_SubSquare, [X_Inicial(1) + razon; X_Inicial(2)], [X_Inicial(1) + 2*razon; X_Inicial(2)], Y_SubSquare, (numIteraciones - 1));
        
        drawSubSquares(Y_SubSquare, [X_Inicial(1) + 2*razon; X_Inicial(2)], Y_Inicial, [Y_Inicial(1); Y_Inicial(2) - razon], (numIteraciones - 1));
        drawSubSquares(Z_SubSquare, Y_SubSquare, [Y_Inicial(1); Y_Inicial(2) - razon], [Y_Inicial(1); Y_Inicial(2) - 2*razon], (numIteraciones - 1));
        
        drawSubSquares([Z_Inicial(1) - razon; Z_Inicial(2)], Z_SubSquare, [Y_Inicial(1); Y_Inicial(2) - 2*razon], Z_Inicial, (numIteraciones - 1));
        drawSubSquares([W_Inicial(1) + razon; W_Inicial(2)], W_SubSquare, Z_SubSquare, [Z_Inicial(1) - razon; Z_Inicial(2)], (numIteraciones - 1));  
    end
end

