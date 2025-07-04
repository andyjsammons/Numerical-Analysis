%homework set 5 problem 1

a1 = (1:10)';
a2 = a1 + 1e-15*randn(10,1);



q1 = a1/norm(a1);
r12 = q1'*a2;
q2hat = a2-r12*q1;
r22 = norm(q2hat);
q2 = q2hat/r22;

q1'*q2



