f(x)=log(x)

function biseccion(f,a,b,niter,tol)

    c=(a+b)/2

    if f(a)*f(b)<0
        println("Hay una raiz en este intervalo")
    else 
        println("No hay raices en este intervalo")
    end

    if   f(c)> tol && f(c)*f(a)<0
      
        for i in niter
            
         c=(a+b)/2

            if  abs(f(c)) < tol
                println("Hay una raiz en este intervalo la cual es ", c, ". Y el numero de interacciones es ", i  )

                break
                
            elseif f(c)*f(a) < 0
                b=c
            else f(c)*f(b)
                a=c
            end
        end
    else
        println("No hay raices en este intervalo")

end

end
biseccion(f,0.5,2,1:100,1*10^(-10))


#segunda función


b_values=2:1:20
t=zeros(length(b_values))

function Interacciones(b_values)
    a = 0.5
    niter = 100
    tol = 1e-10
f(x)=log(x)
    for (i, b) in enumerate(b_values)
        t[i] = biseccion(f,a,b,niter,tol)
    end
    return t
end
Interacciones(b_values)
