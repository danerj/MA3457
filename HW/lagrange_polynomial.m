function [ P_D ] = lagrange_polynomial( x, f, D, a, b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

x_data = linspace(a,b,D);

F = ones(D,1) * x_data;

F = F - F' + eye(D);

P_D = 0;

for ii = 1:D
    
    numer = x - x_data;
    numer(ii) = 1;
    numer = prod(numer);
    
    denom = prod(F(:,ii));

    P_D = P_D + f(x_data(ii))*numer / denom;

end








