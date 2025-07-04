function b = Myupper(U,b)

%inputs upper triangular matrix U, and vector b
%outputs vector x


[n,m] = size(U);

if n~=m
    disp('error: you made a mistake')
end





for i = n:-1:1
    
    if U(i,i) == 0
        disp('error: second error')
        return
    end
    b(i) = b(i) - U(i,i+1:n) * b(i+1:n);
    b(i) = b(i)/U(i,i);
end
    