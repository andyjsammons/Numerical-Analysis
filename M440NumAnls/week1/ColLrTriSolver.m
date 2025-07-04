function b = ColLrTriSolver(L,b)

%inputs: Lower triangular matrix L and vector b
%outputs: x values stored in b vector


[m,n] = size(L);

if m~=n
    disp('Error: non square matrix')
    return
end
if L(n,n) == 0
    disp('warning: matrix is singular')
end

% {L(1,1)x(1) = b(1)
% {L(2:n,1)*x(2:n) + L(2:n,2:n)*x(2:n) = b(2:n)

for i = 1:n
    b(i) = b(i)/L(i,i);
    b(i+1:n) = (b(i+1:n) - L(i+1:n,i)*b(i));
    
end
    
    
    
    
    
    