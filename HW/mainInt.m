%Main file for integration
clear all
f = @(y) sqrt(1+y^2);
exact = (5/2)*sqrt(26)-(1/2)*log(-5+sqrt(26));
a = 0;
b = 5;
%f=@(y) 2+cos(y)*cos(3*y);
%exact=2*pi
%a=0;
%b=2*pi;

Nvec=[10 20 40 80 160];
n=length(Nvec);
for i=1:n
    Ntot=Nvec(i);
    IntT=Trap(f,a,b,Ntot);
    ErT(i)=abs(exact-IntT);
    h = (b-a)/Ntot;
    
    ErTh(i)=ErT(i)/(h^2);
    
    IntS=Simp(f,a,b,Ntot);
    ErS(i)=abs(exact-IntS);
    h = (b-a)/Ntot;
    ErSh(i)=ErS(i)/(h^4);
end
