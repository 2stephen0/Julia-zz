#suma de los elementos de las filas impares para una matriz de números aleatorios de dimensión 100x100
a=rand(100,100)
cero=0
#bucle
for j=1:100
    if isood(j)
    
        suma_impar=sum(a[j])
      cero =suma_impar
    end
end
println("La suma de las filas impares es " , cero)




