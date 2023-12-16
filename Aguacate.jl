using Plots
using LinearAlgebra

#Función
f(x) = x^3
#Primera derivada
f1(x0) = (f(x0 + h) - f(x0 - h)) / 2h
#segunda derivada
f2(x0) = (f(x0 + h) + f(x0 - h) - 2f(x0)) / (h^2)

h = (3 - 1) / 100

function aguacate05(h, x0)
    for x0 in 1:h:3
        y = x0^3
        global m = println(y)
    end
end

function aguacate1(h, x0)
    for x0 in 1:h:3
        y1 = (f(x0 + h) - f(x0 - h)) / 2h
        println(y1)
    end
end

function aguacate(h, x0)
    for x0 in 1:h:3
        y2 = (f(x0 + h) + f(x0 - h) - 2f(x0)) / (h^2)
        println(y2)
    end
end

#primera derivada 
aguacate1(h, x0)
#función
aguacate05(h, x0)
#segunda derivada
aguacate(h, x0)

#Grafica
scatter(f.(s));
scatter!(f1.(s));
scatter!(f2.(s));
title!("Derivadas")

#Matriz

#Primera derivada

f(x) = x^3;
h = (3 - 1) / 100;
s = 1:h:3;
N = 100;
v = zeros(N);
H = ones(N - 1);
a = diagm(0 => v, 1 => H, -1 => -H)
q = f.(range(1, stop=3, length=100))


U1 = (1 / (2h)) * (a*q)[2:end-1]


#segunda derivada 


f1(x0) = (f(x0 + h) - f(x0 - h)) / 2h;
h = (3 - 1) / 100;
s = 1:h:3;
N = 100;
v = zeros(N);
H = ones(N - 1);
a = diagm(0 => v, 1 => H, -1 => -H)
Q = f1.(range(1, stop=3, length=100))


U2 = (1 / (2h)) * (a*Q)[2:end-1]


scatter(f.(s));
scatter!(U2);
scatter!(U1);
