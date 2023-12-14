using Plots
using LinearAlgebra
function Runge_kutta(psi,V,j,dz,N)
    k1 = V*(psi[2:end]+psi[1:end-1])+j*psi[1:end-1].^2 .*psi[1:end-1]
    k2 = V*(psi[1:end-1]+[0;psi[3:end]]+k1)+j*(psi[1:end-1]+k1).^2 .*(psi[1:end-1]+k1)
    k3 = V*(psi[2:end]+[0;0;psi[4:end]]+k2)+j*(psi[1:end-1]+k2).^2 .*(psi[1:end-1]+k2)
    k4 = V*(psi[1:end-1]+[0;psi[3:end]]+k3)+j*(psi[1:end-1]+k3).^2 .*(psi[1:end-1]+k3)
    psi_a=zeros(N)
    psi_a[1:end-1] .=psi[1:end-1]+dz*(1/6)*(k1+2*k2+2*k3+k4)
    psi_a /= norm(psi_a)

    return psi_a
end

function DNLSE(V,j,a,b,N)
    global dz=(b-a)/N
    global psi0=zeros(N)
    psi0[51]=1.0
    psi=psi0
    P=zeros(N+1)
    H=zeros(N+1)
    error_P=zeros(N)
    error_H=zeros(N)
    for n in 1:N+1
        psi = Runge_kutta(psi,V,j,dz,N)
        psi /=sqrt(sum(abs2,psi)*dz)
        P0 = sum(abs.(psi).^2*dz)
        H0 = -V*sum(conj.(psi[1:end-1]) .*psi[2:end])
        P[n]=P0
        H[n]=H0
    end
    for n in 2:N+1
        error_P[n-1]=abs((P[n]-P[n-1])/P[n-1])
        error_H[n-1]=abs((H[n]-H[n-1])/H[n-1])
    end
    return P,H,psi, error_P, error_H
end

P,H,psi, error_P, error_H=DNLSE(1,1,0,50,101)

z=0:dz:50

plot(abs.(psi0).^2,label="|ψn|^2",xlabel="n",title="Gráfica |ψ|^2 vs n")
plot(z,P,label="Probabilidad",title="Gráfica P vs z")
plot!(z, H ,label="Hamiltoniano", title= "Gráfica H vs z" )

error_P=sum(error_P[2:end-1])
error_H=sum(error_H[2:end-1])