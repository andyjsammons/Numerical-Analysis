%eigenvalue problem (power method)

n = 100; %size of matrix A

%matrix with known eigenvalues

S = randn(n,n);
D = diag(1./(1:n));
D(2,2) = 0.9;
A = S*D*inv(S);

x = randn(n,1);
residual = zeros(n,1);
for i = 1:300  %number of iterations
    x = A*x;
    x = x/norm(x);
    e = (x'*A*x);
    residual(i) = norm(A*x - e*x)/norm(A,1);%use 1 or inf norm cause 2 norm is expensive
    
end

semilogy(residual,'rx')












