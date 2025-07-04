%hw 7 problem 4

function [e,x] = rayleigh_hess(A,starting_shift,it_max)

n = size(A,1);

[m,n] = size(A); %get dimension of A
%check n = m
if n~= m
    disp('error: the matrix must be square')
    return
end
L = eye(n);
for i = 1:n-1
    if A(i,i)==0
        disp('error: A does not have an LU factorization')
        return
    end
    for j=i+1
    L(i+1,i) = A(j,i)/A(i,i); %multiplier
    A(i+1,i) = 0;
    A(i+1,i+1:n) = A(i+1,i+1:n)-L(i+1,i)*A(i,i+1:n);
%        for k = i+1:n %can you replace this loop with a matrix operation?
%            A(j,k) = A(j,k)-L(j,i)*A(i,k);
%       end
    end
end
%final check
if A(n,n)==0
    disp('warning: A is singular')
end   
U = A;

x = randn(n,1);

shift = starting_shift;
it = it_max;

%[L,U,p] = lu(A - shift*eye(n),'vector');

residual = zeros(it,1);
for i = 1:it
    x = U\(L\x);
    x = x/norm(x);
    shift = x'*A*x;
    
    [L,U,p] = lu(A - shift*eye(n),'vector');
    residual(i) = norm(A*x - shift*x)/norm(A,1);
end

semilogy(residual,'rx')
e = shift;






