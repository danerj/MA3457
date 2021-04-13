% Real Solution
syms x
y(x) = (x.^2)*(exp(x)-exp(1));

h = .2; t = 1:h:2; % step size
% Taylor's Method of Order 2
tic
TM = 0; % initial value
for i=1:length(t)-1
    f  = ((2*TM(i))/t(i))+((t(i)^2)*exp(t(i)));
    f1 = (-2*TM(i)*(t(i)^-2))+2*t(i)*exp(t(i))+(t(i)^2)*exp(t(i))+ ...
         (2/t(i))*f;
    TM(i+1) = TM(i) + h*(f+(h/2)*f1);
end
toc
 
% Runge-Kutta Order 2
tic
RK2= 0; % initialize value
for i=1:length(t)-1
    f  = ((2*RK2(i))/t(i))+((t(i)^2)*exp(t(i)));
    f1 = ((2*(RK2(i)+((h/2)*f)))/(t(i)+(h/2)))+ ...
         (((t(i)+(h/2))^2)*exp(t(i)+(h/2)));
    RK2(i+1) = RK2(i) + h*f1;
end
toc
 
% Implicit Euler Method
tic
IM = 0; % initialize value
for i=1:length(t)-1
   IM(i+1) = (IM(i)+h*(t(i+1)^2)*exp(t(i+1)))/(1-((2*h)/t(i+1)));
end
toc
 
% Error Calculations
real_vals = vpa(y(t));
error_TM  = abs(sum(real_vals-TM))
error_RK2 = abs(sum(real_vals-RK2))
error_IM  = abs(sum(real_vals-IM))
 
% Plots
figure
ezplot(y,[1 2])
hold on
scatter(t,TM,'r'); scatter(t,RK2,'g'); scatter(t,IM,'m')
hold off
xlabel('t'); ylabel('y'); 
title(['Approximated Solutions of ODE w/ h = ' num2str(h)])
legend('Real Solution','Taylor''s Method Order 2','Runge-Kutta Order 2', 'Implicit Euler Method')

