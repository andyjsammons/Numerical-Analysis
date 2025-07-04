%hw 7 problem 3
% 


A = [1 1 1; -1 9 2; 0 -1 2];

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
x

%Eigenvalues:
%_________________
%lambda1 = 2.1949
%lambda2 = 1.2207 + 0.0000i
%lambda3 = 8.5844
%-----------------

%Eigenvectors:
%_________________
%x1 = -0.5201 + 0.1839i
%      0.1504 - 0.0532i
%     -0.7718 + 0.2730i
%x2 = -0.9879 - 0.0007i
%     -0.0955 - 0.0001i
%     -0.1225 - 0.0001i
%x3 = -0.1099 - 0.0020i
%     -0.9825 - 0.0183i
%      0.1492 + 0.0028i



