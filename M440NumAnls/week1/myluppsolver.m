function x = myluppsolver(A,b)

[m,n] = size(A);
if m~=n 
    disp('Error: we are not happy because we do not have a square matrix')
    return
end



%step 1: factor PA = LU
[L,U,p] = myLupper(A); % or [L,U,p] = lu(a,'vector')
%step 2: permute

%b = b(p); for the sake of the assignment I am not going to use partial
%pivoting.
%step 3: solve Ly = b by forward substitution:
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

%step 4 solve Ux = y