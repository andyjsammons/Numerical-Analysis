%homework set 5 problem 1

a1 = (1:10)';
a2 = a1 + 1e-15*randn(10,1);



q1 = a1/norm(a1);
r12 = q1'*a2;
q2hat = a2-r12*q1;
r22 = norm(q2hat);
q2 = q2hat/r22;

q1'*q2



%why are computed vectors q1 and q2 non-orthogonal?

%note that a1 and a2 are approximately the same vector differing by some
%factor of very small magnitude. The computed value of r12 is very similar
%to a2. I believe the cancellation error occurs in the calculation of
%q2hat. The true value of q1'*q2 is 0 (due to orthogonality), but given the
%computed value is not zero, the likely error is cancellation.
%



