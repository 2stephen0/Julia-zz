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




using Plots

# Definir una función de ejemplo que mapea de ℝ² a ℝ²
function example_mapping(x, y)
    return [x + 2y, x - y]
end

# Punto en el espacio de entrada
x0, y0 = 1.0, 2.0

# Calcular el Jacobiano en el punto (x0, y0)
function jacobian_mapping(f, x, y)
    J = [forwarddiff(f, i, [x, y]) for i in 1:2]
    return hcat(J...)
end

Jacobian = jacobian_mapping(example_mapping, x0, y0)

# Visualizar el Jacobiano como una matriz
heatmap(Jacobian, aspect_ratio=:equal, color=:auto, c=:balance, title="Jacobiano")
