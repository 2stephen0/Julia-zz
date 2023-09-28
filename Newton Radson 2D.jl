using Plots
using Pkg
using LinearAlgebra


f1(x, y) = -10 + x + (y^3)
f2(x, y) = -10 + y + (x^3)
f(x, y) = [-10 + x + (y^3); -10 + y + (x^3)]
J(x, y) = [1 3(y^2); 3(x^2) 1]

function newton_rapson(f, x0, y0, tol)

    if f(x0, y0) == [0, 0]
        i = 0
        i = i + 1
        println("Hay una raiz, la cual esta en el punto ", (x0, y0))

    else
        (x1, y1) = [x0, y0] - (inv(J(x0, y0)) * f(x0, y0))
        i = 0
        i = i + 1

    end
    while abs(f1(x0, y0)) > tol || abs(f2(x0, y0)) > tol
        i = i + 1
        (x0, y0) = (x1, y1)
        (x1, y1) = [x0, y0] - (inv(J(x0, y0)) * f(x0, y0))

    end
    println("la aproximación más precisa está en el punto ", (x1, y1), " y las interacciones necesarias fueron ", i)
end

newton_rapson(f, 9, 1, 1 * 10^(-5))

