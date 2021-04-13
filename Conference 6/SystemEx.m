%System of IVPs
close all
clear all
h=0.01;
t=[0:h:1];
N=length(t);


%numerical approx to u_1 is w1
%numerical approx to u_2 is w2
w1(1)=1;
w2(1)=1;
%exact solution
%Let f=right hand side of u'_1
f=@(ti,w1,w2) 3*w1+2*w2-(2*(ti)^2+1)*exp(2*ti);
%Let g= right hand side of u'_2
g=@(ti,w1,w2) 4*w1+1*w2+((ti)^2+2*ti-4)*exp(2*ti);

%Actual solutions
u1=(1/3)*exp(5*t)-(1/3)*exp(-t)+exp(2*t);
u2=(1/3)*exp(5*t)+(2/3)*exp(-t)+t.^2.*exp(2*t);

for i=1:N-1
    %Euler method update approximation for 2 variables
    w1(i+1)=w1(i)+h*f(t(i),w1(i),w2(i));
    w2(i+1)=w2(i)+h*g(t(i),w1(i),w2(i));
end

figure(1)
plot(t,u1,'--g')
hold on
plot(t,w1,'-.b','LineWidth',3)
legend('Exact','Euler')
title('u_1 solution')
    
figure(2)
plot(t,u2,'--g')
hold on
plot(t,w2,'-.b','LineWidth',3)
legend('Exact','Euler')
title('u_2 solution')
    