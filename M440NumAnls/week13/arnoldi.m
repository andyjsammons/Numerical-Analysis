function [Q,H] = arnoldi(A,x,k,reortho)

Q = x/norm(x);
H = zeros(k+1,k);
for i = 1:k
    q = A*Q(:,end); 
    
    %orthogonalize q against the columns of Q
    h = Q'*q; 
    q = q - Q*h;
    if reortho == 1
        %re orthogonalize 
        s = Q'*q;
        q = q-Q*s;
        h = h+s;
    end
    %normalize
    hh = norm(q);
    q = q/hh;
    %update Q and H
    Q = [Q q];
    H(1:i+1,i) = [h;hh];
end 

% a) The matrix west0479
%   With reorthogonalization:
%       norm(eye(100) - Q'*Q) = ~0
%   W/out reorthogonalization:
%       norm(eye(100) - Q'*Q) = 15.1197 

% b) The discrete Laplacian matrix delsq(numgrid('N',20))
%   W/out reorthogonalization:
%       norm(eye(100) - Q'*Q) = 21.71
%   With reorthogonalization:
%       norm(eye(100) - Q'*Q) = ~0

% c) The matrix A = sprandn(B) + sqrt(-1)*sprandn(B)
%   With reorthogonalization:
%       norm(eye(100) - Q'*Q) = ~0
%   W/out reorthogonalization:
%       norm(eye(100) - Q'*Q) = ~0



