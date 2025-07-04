function x = myLUsolver(A,b)

%step 1: factor A = LU

[L,U] = myLOWERupper(A);
[m,n] = size(A);
if m~=n 
    disp('Error: we are not happy because we do not have a square matrix')
    return
end
p = length(b);
if n ~= p
    disp('error: again, we are not happy')
    return
end
%step 2: solve Ly = b by forward substitution:
y = zeros(n,1);

for i = 1:n
    y(i) = b(i) - L(i,1:i-1)*y(1:i-1);
end
%step 3: solve Ux = y by back substitution:

x = zeros(n,1);
for i = n:-1:1
    x(i) = y(i) - U(i,i+1:n)*x(i+1:n);
    x(i) = x(i) / U(i,i);
    
end



