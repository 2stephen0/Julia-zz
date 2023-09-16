using Plots
using Calculus

f(x) = (x^2) - cos(x - 1) - 3
d(x) = 2x + sin(x - 1)

function newton_rapson(f, d, x0, tol)
    s = -10:0.1:10

    if f(x0) == 0
        println("La raíz es ", x0)
        return
    else
        i = 0
        g(x) = x - (f(x0) / d(x0))
        tangent_lines = []

        p1 = plot(s, f.(s), label="f(x)")
        title!("Método de Newton-Raphson")

        while abs(f(g(x0))) > tol
            i += 1
            push!(tangent_lines, x -> f(x0) + d(x0) * (x - g(x0)))
            x0 = g(x0)
            g(x0) = x0 - (f(x0) / d(x0))
        end

        for (j, tangent) in enumerate(tangent_lines)
            plot!(s, tangent.(s), label="Tangente en iteración $j")
        end

        xlabel!("x")
        ylabel!("f(x)")

        println("Las iteraciones son ", i)
        println("La aproximación más precisa es ", g(x0))

        display(p1)
    end
end

newton_rapson(f, d, 3, 1e-5)

