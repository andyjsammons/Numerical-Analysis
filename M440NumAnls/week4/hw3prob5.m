function solution = solveBoud(f,t_0,t_1,m)
%I got help from Jake Pennington on this.

A = eye(m-1) + eye(m-1);
z1 = [zeros(1,m-1); eye(m-2) zeros(m-2)];
z2 = [zeros(m-2,1) eye(m-2); zeros(1,m-1)];
A = A - z1;
A = A - z2;

h = 1/m;

z = zeros(m,1);

for i = 1:m
    x(i) = i*h;
end

b = zeros(m-1,1);
b(1) = h2*f(x(1)) + t_0;

for i = 2:m-2
    b(i)*f(x(i));
end
b(m-1) = h2*f(x(m-1)) + t_1

Col = chol(A);
solution = Col'\b;
solution = c\solution

