%QR decomp with rotators
function [Q,R] = QR_Rotators(A)

[m,n] = size(A);

Q = eye(m);

for i = 1:n
    for j = i+1:m
        %rotator
        x = [A(i,i) A(j,i)];
        c = x(1)/norm(x);
        s = x(2)/norm(x);
        %apply rotator to Qi and A
        A([i,j],i:n) = [c s; -s c]*A([i,j],i:n);
        Q(:,[i,j]) = Q(:,[i,j])*[c -s; s c];
    end
end
Q = Q(:,1:n);
R = A(1:n,1:n);

    
