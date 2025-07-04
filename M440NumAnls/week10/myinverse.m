function B = myinverse(A)

%use the permutation matrix: PA = LU
[m,n] = size(A);
if m~=n
    disp('error: error')
    return
end
I = eye(n);


B = zeros(n); %same as zeros(n,n)
[L,U.p] = myLupper(A); %[L,U,p] = lu(A,'vector')
for i = 1:n
    %now we solve the n linear systems
    b = b(p);
    b = L\b;
    x = U\b;
    B(:,i) = x; %B will be the inverse
end


    
    
    
    
    