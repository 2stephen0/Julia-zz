#Mostrar series de Fibonacci hasta 10 términos.

b = 1:1:10
n = 10
y = zeros(length(b)) 

y[1] = 0  
y[2] = 1  

for i in 3:n
    y[i] = y[i-1] + y[i-2]
end

println(y)









