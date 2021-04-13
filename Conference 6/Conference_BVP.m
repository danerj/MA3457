close all
clear all
N=50;
a=0;
b=1;
%set spatial step size
h=0.05;
%set up grid of x-values
x=[a:h:b];
%total # of grid values
N=length(x);
%Values at left and right boundary conditions
alpha=1;
beta=0;
exact=(exp(2-x)+exp(x))/(1+exp(2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Will be solving Au=R to determine solution u(x)
%For N x-values on the grid, A is NxN, R is Nx1 and u is Nx1

%right hand side vector
R=zeros(N,1);
%specify boundary conditions
R(1)=alpha;
R(N)=beta*h;
%pre-allocationg A matrix as zeros
A=zeros(N,N);
%allocating A based on boundary conditions
A(1,1)=1;
A(N,N-1)=-1;
A(N,N)=1;
for i=2:N-1
    A(i,i-1)=1;
    A(i,i)=-(2+h^2);
    A(i,i+1)=1;
end
u=A\R;

figure(1)
plot(x,u,'-.b')
hold on
plot(x,exact,'--g')
legend('Approximation','Exact')
