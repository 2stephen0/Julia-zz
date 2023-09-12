#Mostrar series de Fibonacci hasta 10 términos.

b = 1:1:100
n = 100
y = zeros(length(b)) 

y[1] = 0  
y[2] = 1  

for i in 3:n
    y[i] = y[i-1] + y[i-2]
end

   a=println(y);


   using Plots

plot(b,y)









