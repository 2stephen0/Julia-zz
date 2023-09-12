#Método de bisección para encontrar raices.

f(x)=(x^3)-9
x=1

function biseccion(f,a,b)

    #Es importante para declarar la variable c
    c=(a+b)/2

    #Con este condicional te aseguras en que intervalo se encuentra la raiz, esto se sabe dado que si uno de los puntos es negativo;
    #el producto entre ellos lo será y por lo tanto será mayor que cero
    #Con esto se verifica, si hay un cambio de signo entre los puntos se puede afirmar que hay una raiz en ese intervalo

    if f(a)*f(b)<0
        println("Hay una raiz en este intervalo")
    else 
        println("No hay raices en este intervalo")
    end

#Ya teniendo la raiz se procede a realizar lo mismo para aproximarse al valor real, Se toma f(C) el cual tiene que ser mayor que cero, 
#pero debido a que este  se aproxima a cero se le aproxima a un valor cercano a el, en donde tambien tiene que cumplir la condición del producto
#del intervalo a buscar la raiz. se reliza el for, en donde se pone la condición que se aproxime a cero con c=a y c=b

    if   f(c)>1*10e-8 && f(c)*f(a)<0
      
        println("Hay una raiz en este intervalo la cual es" )

        for i in 1:100
            
           global  c=(a+b)/2

            if  abs(f(c)) < 1e-8
                println( c)
                return
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

biseccion(f,1,4)



