%F(x) = sum(x^i) from i = 0 to n
%want to compute the coefficients that interpolate the above function
%at the n+1 points x_i = 1+i/n for i = 0:n. Do this for n = 7,9,11,13

%problem 1 part b)
ens = [7 9 11 13];
ex1 = zeros(ens(1),1);
ex2 = zeros(ens(2),1);
ex3 = zeros(ens(3),1);
ex4 = zeros(ens(4),1);

for i = 1:ens(1)+1
       ex1(i)  = 1 + (i-1)/ens(1);
end

for i = 1:ens(2)+1
    ex2(i) = 1 + (i-1)/ens(2);
end

for i = 1:ens(3)+1
    ex3(i) = 1 + (i-1)/ens(3);
end

for i = 1:ens(4)+1
    ex4(i) = 1 + (i-1)/ens(4);
end

Vand1 = vander(ex1)'
Vand2 = vander(ex2)';
Vand3 = vander(ex3)';
Vand4 = vander(ex4)';

%problem 1 part c)
Cond1 = cond(Vand1)
Cond2 = cond(Vand2)
Cond3 = cond(Vand3)
Cond4 = cond(Vand4)

%problem 1 part d)

%let a_n be the actual values of the coefficients, and let c_n be the computed
%values where n = 7,9,11,13.
%I'll start by defining several a_n vectors for each n
%after I'll use the actual values to caluclate the actual solution P(x)
%where I will use b_n for P_n(x) for n = 7,9,11,13.

a_7 = ones(7+1,1);
a_9 = ones(9+1,1);
a_11 = ones(11+1,1);
a_13 = ones(13+1,1);

b_7 = zeros(8,1);
for i = 1:length(Vand1(1,:))
    b_7(i) = dot(a_7, Vand1(i,:));
end
b_9 = zeros(10,1);
for i = 1:length(Vand2(1,:))
    b_9(i) = dot(a_9,Vand2(i,:));
end
b_11 = zeros(12,1);
for i = 1:length(Vand3(i,:))
    b_11(i) = dot(a_11,Vand3(i,:));
end
b_13 = zeros(14,1);
for i = 1:length(Vand4(i,:))
    b_13(i) = dot(a_13,Vand4(i,:));
end

c_7 = Vand1\b_7;
c_9 = Vand2\b_9;
c_11 = Vand3\b_11;
c_13 = Vand4\b_13;

%here the relative error between the computed values and actual values a_n
%c_n are computed.
rel_error7 = norm(a_7 - c_7)/norm(a_7)
rel_error9 = norm(a_9 - c_9)/norm(a_9)
rel_error11 = norm(a_11 - c_11)/norm(a_11)
rel_error13 = norm(a_13 - c_13)/norm(a_13)

%the relative error increases with the size of the condition number.
    











