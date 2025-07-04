%hw 3 problem 4:

n = 60;
A = eye(n,n) - tril(ones(n,n),-1);
A(:,n) = 1;
cond(A)

b = randn(n,1);
z = zeros(n,1);
x = A\b;
%compute the relative residual norm:
r = A*x-b;
RelativeResidual = norm(r)/(norm(A)*norm(x));
%check the accuracy of the computed solution:
RelativeError = cond(A)*RelativeResidual;

%iterative refinement:

d = A\r;
y = x-d;

%given the high Relative Error lets call x_pert the solution to our slightly
%perturbed system. We can then say that There exists E such that (A + E)x = b
%Let the residual be defined as r = (A+E)x_pert - b, where b == b_actual(the actual solution)
%if there are no rounding -
%errors involved in computing r, then we have a very reliable difference
%between b_pert ((A+E)x_pert) and b_actual. Now we want to find the actual value of x,
%call it y. Let the exact difference between Ay and Ax_pert be A\r, then 
%y = x_pert - A\r will be the exact solution, where A\r corrects errors in
%x_pert. Therefore, regardless of how perturbed x_pert is, we can always
%close in on the exact value y, given there are no rounding errors in
%calculating r.

r = A*y - b;
RelativeResidual = norm(r)/(norm(A)*norm(y))
RelativeError = cond(A)*RelativeResidual   %very small.








