function b = MylowerCol(L,b)
%column oriented version of forward substitution

[n,m] = size(L);

if n ~= m
    disp('error: youve made an err0r')
    return 
end


if n==1
    b = b/L;
else
    b(1) = b(1)/L(1,1);
    b(2:n) = MylowerCol(L(2:n,2:n),b(2:n) - L(2:n,1)*b(1));
end







