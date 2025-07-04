%F(x) = sum(x^i) from i = 0 to n
%want to compute the coefficients that interpolate the above function
%at the n+1 points x_i = 1+i/n for i = 0:n. Do this for n = 7,9,11,13
ens = [7 9 11 13];
ex1 = zeros(ens(1),1);
ex2 = zeros(ens(2),1);
ex3 = zeros(ens(3),1);
ex4 = zeros(ens(4),1);

for i = 1:ens(1)+1
       ex1(i)  = 1 + (i-1)/ens(1);
end

for i = 1:ens(2)
    ex2(i) = 1 + (i-1)/ens(2);
end

for i = 1:ens(3)
    ex3(i) = 1 + (i-1)/ens(3);
end

for i = 1:ens(4)
    ex4(i) = 1 + (i-1)/ens(4);
end

Vand1 = vander(ex1);
Vand2 = vander(ex2);
Vand3 = vander(ex3);
Vand4 = vander(ex4);

Cond1 = cond(Vand1)
Cond2 = cond(Vand2)
Cond3 = cond(Vand3)
Cond4 = cond(Vand4)












