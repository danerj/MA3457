clear all

f=@(x) (cos(x))^2;

x1=0.25;
x0=-0.25;
h=x1-x0;

Trap=(h/2)*(f(x0)+f(x1))

syms x
g=(cos(x))^2;

ExactIntIndef=int(g)
EvalExactInt=double(subs(ExactIntIndef,x1))-double(subs(ExactIntIndef,x0))

ActualError=EvalExactInt-Trap
ActualErrorInt=double(int(g,x0,x1))-Trap
d2=diff(g,2)
xch=linspace(x0,x1,25);
plot(xch,abs(subs(d2,xch)))
%Can see 2nd deriv largest at x=0 
M=abs(double(subs(d2,0)));
UpperBoundTheoryError=M*h^3/12
