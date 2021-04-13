%% 

clear all
close all
clc

nodes = [5 10 15 20];
xeval = linspace(-1,1);
f = @(x) 1./(1+25*x.^2);

for n = 1:length(nodes)
    
    D = nodes(n);
    y = zeros(100,1);
    for k = 1:length(xeval)
        y(k) = lagrange_polynomial(xeval(k), f, D, -1, 1);
    end
    
    x_data = linspace(-1,1, D);
    figure(n)
    plot(xeval, y, xeval, f(xeval), x_data, f(x_data), '*', 'linewidth', 1)
    hold on

end

%%

clear all
close all
clc

nodes = [5 10 15 20];
xeval = linspace(-1,1);
f = @(x) 1./(1+25*x.^2);

for n = 1:length(nodes)
    
    D = nodes(n);
    y = zeros(100,1);
    for k = 1:length(xeval)
        y(k) = lagrange_polynomial_cheb(xeval(k), f, D, -1, 1);
    end
    
    x_data = linspace(-1,1, D);
    figure(n)
    plot(xeval, y, xeval, f(xeval), x_data, f(x_data), '*', 'linewidth', 1)
    hold on

end