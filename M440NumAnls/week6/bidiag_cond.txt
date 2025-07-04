%homework 4 problem 2
function [Kappa] = bidiag_cond(a,b)
n = length(a);
B = diag(a) + diag(b,1);

B_inv = zeros(n,n);

for i = 1:length(a)
    B_inv(i,i) = 1/a(i);
    for j = i+1:length(a)
        B_inv(i,j) = -B_inv(i,j-1)*(b(j-1)/a(j));
    end
end

Kappa = norm(B,inf)*norm(B_inv,inf);


