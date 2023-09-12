 function cuadratica(a,b,c)
f(a,b,c)= (-b + sqrt(complex(b^2-(4*2*c))))/2a

f(a,b,c)= (-b - sqrt(complex(b^2-(4*2*c))))/2a
    
if    (b^2 -(4*2*c))<0

    print("Las soluciones son complejas ", f(a,b,c))

else

    print("Las soluciones son reales ", f(a,b,c))

end
print(f(a,b,c))
end
cuadratica(1,2,3)


