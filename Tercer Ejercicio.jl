using Plots
using Pkg
Pkg.add("Animations")
using Animations
  f(x)=(x^2)-cos(x-1)-3
    d(x)=2x+sin(x-1)
      y(x)=f(x)+d(x)*(x-x0)
        s=-12:12
function newton_rapson(f,d,x0,tol)
  x1=x0-(f(x0)/d(x0))
     if  f(x0)==0
        println("Hay una raiz")
         else
           i=0; y=0; i=i+1; z(x)=0
               x1=x0-(f(x0)/d(x0))
                plot(s, f.(s), linestyle=:dash,color="black")
                 title!("Método de Newton-Raphson"); xlabel!("x"); ylabel!("f(x)")
                   scatter!(x0,z,color="blue",legend=false); scatter!(x0,y,color="black",legend=false)
     end
     while abs(f(x0))>tol
           i=i+1; x0=x1; x=[x0]
              x1=x0-(f(x0)/d(x0))
                y(x)=f(x0)+(d(x0))*(x-x0)
                  Grafica=plot!(s,y.(s))
                   G_2=scatter!(x,z,color="blue")
                    G_3=scatter!(x,y,color="black")
                     display(Grafica); display(G_2); display(G_3)
                       @animate for i in s
                         plot!(y,0,s)
                           end 
     end 
     println("Las interacciones son ",i,",y la aproximación más precisa es ", x1)
end

newton_rapson(f,d,12,1*10^(-5))S