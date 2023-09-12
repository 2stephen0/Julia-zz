#Dos funciones analiticas, ver si son par o impar, verificar el producto de ambas & comprobar 
#Si el resultado es imaper o par.
#Observar grafica

f(x)=x^2
g(x)=sin(x)
xmax=pi 
xmin=-pi 
x=3pi/2;
        function funcion_analitica(f,g,xmax,xmin)

 if f(-x)==f(x)
    print(" La función f(x) " , f(x) , " Es par
    " )
 elseif  f(-x)==-f(x)
    print(" La función f(x) " , f(x) , " Es impar
    " )
 else 
    print(" La función f(x) " , f(x) , " No tiene paridad
    " )
end

if g(-x)==g(x)
    print("La función g(x) " , g(x) , " Es par
    " )
elseif -g(x)==g(-x)
   print("La función g(x) " , g(x) , " Es impar
   " )
else
    print("La función g(x) " , g(x) , " No tiene paridad
    " )
end

if  f(x)*g(x)==f(-x)*f(-x)

    print(" La función f(x)*g(x) " , f(x)*g(x) , " Es par" )

elseif -f(x)*g(x)==f(-x)*f(-x)

    print(" La función f(x)*g(x) " , f(x)*g(x) , " Es impar" )
 else
    print(" La función f(x)*g(x) " , f(x)*g(x) , " No tiene paridad" )  
end
end
funcion_analitica(f,g,xmax,xmin)

#Grafica de las funciones analiticas y el resultado del producto entre ambas

using Plots

f(x)=x^2
g(x)=sin(x)
 s=f(x)*g(x)
 
 plot!(f,g, -pi, s, )

