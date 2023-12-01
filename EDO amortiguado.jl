using Plots
using LinearAlgebra

function EDO(t, U, w, p)
    dx1 = U[2]
    dx2 = -(w^2)*U[1] - p*U[2]
    return [dx1, dx2]
end

function EDO2_amortiguado(t0, tf, N, U0, w, p)
    h = (tf-t0) / N
    ti = [t0]
    U_i = [U0]
    E_i = [(1/2)*(w^2) * (U0[1])^2 + (1/2)*(U0[2])^2] 

    while ti[end] < tf
        tn = ti[end]
        Un = U_i[end]
        U = Un + h*EDO(tn, Un, w, p)
        E = (1/2)*(w^2) * U[1]^2 + (1/2)*U[2]^2
        push!(ti, tn + h)
        push!(U_i, U)
        push!(E_i, E)
    end

    Grafica(ti, U_i, E_i)
end

function Grafica(ti, U_i, E_i)
    y = [U[1] for U in U_i]
    v = [U[2] for U in U_i]
    plot(ti[1:end-1], y[1:end-1], label="Posición")
    plot!(ti[1:end-1], v[1:end-1], label="Velocidad")
    plot!(ti, E_i, label="Energía", ylabel="Energía Total")

    title!("EDO Amortiguado")
end

EDO2_amortiguado(0.0, 10.0, 10000.0, [1.0, 0.0], 1.0, 1.0)
