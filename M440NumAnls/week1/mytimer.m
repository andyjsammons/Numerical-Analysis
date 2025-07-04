%this is a new script.
%matrix vector multiplication: our code vs matlab code

n = 10000;
A = randn(n,n);

x = randn(n,1);
tic; %start timer
b = MatVecMult(A,x);
OurCodTm = toc % stop timer


tic; %start timer
b = A*x;

MatLbCdTm = toc %stop timer

