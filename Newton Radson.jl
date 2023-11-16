using Plots
using Pkg
using Calculus


f(x) = x^3 - 2x - 5;
n = 1;
dx = derivative(f, 2)
function newton_rapson(f, x, dx, tol, inter)

   x + n = x - (f(x) / a)
   g(x) = x + n
   for i in 1:inter

      b = x

      if abs(g(x) - (b)) > tol

         g(x) = x - (f(x) / a)

         println("La aproximación más precisa es ", g(x))

         break
      else

      end
   end
end

newton_rapson(f, 2, dx, 1 * 10^(-5), 100)



