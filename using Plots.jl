using Plots

# Define la función y su derivada
f(x, y) = [-10 + x + y^3, -10 + y + x^3]
df(x, y) = [1 3y^2; 3x^2 1]

# Parámetros
tolerancia = 1e-5
x0, y0 = 9.0, 1.0

# Función para aplicar el método de Newton-Raphson y registrar el progreso
function newton_raphson_progress(f, df, x0, y0, tol)
    x, y = x0, y0
    history_x = [x]
    history_y = [y]

    while norm(f(x, y)) > tol
        delta = df(x, y) \ f(x, y)
        x -= delta[1]
        y -= delta[2]
        push!(history_x, x)
        push!(history_y, y)
    end

    return history_x, history_y
end

# Aplicar el método de Newton-Raphson
x_history, y_history = newton_raphson_progress(f, df, x0, y0, tolerancia)

# Graficar progresivamente las iteraciones
animation = @animate for i in 1:length(x_history)
    plot(x -> -10 + x + y_history[i]^3, -12, 12, label="f1", legend=:topleft, title="Newton-Raphson")
    plot!(x -> -10 + y_history[i] + x^3, -12, 12, label="f2")
    scatter!([x_history[i]], [y_history[i]], label="Iteración $i", color="red")
end

gif(animation, "newton_raphson_progress.gif", fps = 2)
using Plots

# Define la función y su derivada
using Plots

# Define la función y su derivada
f(x, y) = [-10 + x + y^3, -10 + y + x^3]
df(x, y) = [1 3y^2; 3x^2 1]

# Parámetros
tolerancia = 1e-5
x0, y0 = 9.0, 1.0

# Función para aplicar el método de Newton-Raphson
function newton_raphson(f, df, x0, y0, tol)
    x, y = x0, y0
    history_x = [x]
    history_y = [y]

    while norm(f(x, y)) > tol
        delta = df(x, y) \ f(x, y)
        x -= delta[1]
        y -= delta[2]
        push!(history_x, x)
        push!(history_y, y)
    end

    return history_x, history_y
end

# Aplicar el método de Newton-Raphson
x_history, y_history = newton_raphson(f, df, x0, y0, tolerancia)

# Crear una animación para mostrar el progreso
anim = @animate for i in 1:length(x_history)
    plot(x -> -10 + x + y_history[i]^3, -12, 12, label="f1", legend=:topleft, title="Newton-Raphson")
    plot!(x -> -10 + y_history[i] + x^3, -12, 12, label="f2")
    scatter!([x_history[i]], [y_history[i]], label="Iteración $i", color="red")
end

gif(anim, "newton_raphson_progress.gif", fps = 2)
