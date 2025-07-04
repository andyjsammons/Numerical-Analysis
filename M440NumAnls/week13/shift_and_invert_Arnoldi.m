function [Q,H] = shift_and_invert_Arnoldi(A,x,shift,k)

n = size(A,1);
Q = x/norm(x);
H = zeros(k+1,k);
[L,U,p] = lu(A-shift*speye(n),'vector');
residuals = ones(10,1);

for i = 1:k
    %multiply last column of Q by (A-shift*I)^-1
    q = U\(L\Q(p,end)); %equivalent to q = inv(A-shift I)*Q(:,end)
    %orthogonalize q  against columns of Q
    h = Q'*q;
    q = q - Q*h;
    %re - orthonormalize for numerical stability
    s = Q'*q;
    q = q - Q*s;
    h = h+s;
    %normalize
    hh = norm(q);
    q = q/hh;
    %update Q
    Q = [Q q];
    %update H
    H(1:i+1,i) = [h;hh];
    
end



