clear all
%initialize h
%h=[1 1e-1 1e-2 1e-3 1e-4 1e-5 1e-6 1e-7 1e-8 1e-9 1e-10 1e-11 1e-12 1e-13 1e-14 1e-15 1e-16];
%n=length(h);
n=50;
%initialize function to call when approximating the deriv
f=@(x) x^2*log(x);
%point is the value we want to approx deriv at
x_0=2;
count=0;
h=1;
for i=1:n
    h=h/(2);
    hvec(i)=h;
    deriv(i)=(f(x_0+h)-f(x_0-h))/(2*h);    
    if(i>2)
        if((deriv(i)-deriv(i-1))>0 && count==0)
            display('optimal computational h is:')
            h
            i-1
            count=count+1;
        end
    end
end

%symbolically define function f to differentiate
syms f(x)
f(x)=x^2*log(x);
%symbolically take the first deriv of f
d1=diff(f,x);
d5=diff(f,x,5)
%Since Taylor Series is on a small interval around x=2, we will use this
%as a rough approximation of M=max|f'''''(\xi)| on [a,b] where x,x+h,x-h in
%[a,b]

%define the symbolic x by a point
x=2;
%evaluate the first deriv at the point x=2
d1Atx=eval(d1);
d5Atx=eval(d1);
M=d5Atx
OptimalhTheory=(45*eps/(4*M))^(1/3)

Error=abs(d1Atx-deriv)

figure(1)

plot(log(hvec),log(Error),'o','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',10,'LineWidth',2)
hold on
plot(log(hvec),log(Error),'--b','LineWidth',2)
hold on
plot(log(ones(1,n)*OptimalhTheory),log(linspace(1e-1,1e-15,n)),'--m','LineWidth',3)
title('Derivative Error for varying h','FontWeight','bold')
xlabel('h','FontWeight','bold')
ylabel('Absolute Error','FontWeight','bold')


