%homework 7 problem 2 Rayleigh iteration 


load west0479 %from matlab collection of test matrices

A = west0479; %A is sparse (most entries are zero)

A(449,450)
n = size(A,1);

x = randn(n,1);

shift = 15 + sqrt(-1)*35;
it = 10;

[L,U,p] = lu(A - shift*eye(n),'vector');

residual = zeros(it,1);
for i = 1:it
    x = U\(L\x(p));
    x = x/norm(x);
    shift = x'*A*x;
    
    [L,U,p] = lu(A - shift*eye(n),'vector');
    residual(i) = norm(A*x - shift*x)/norm(A,1);
end

semilogy(residual,'rx')
shift

%eigenvalue: 17.5485 +34.2378i