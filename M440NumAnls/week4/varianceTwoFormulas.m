
n = 1e6;
x = 1e12 + randn(n,1); %mathematically doesnt make any sense. BUT for matlab, it makes sense


%formula 1: we dont want to compute the mean though.

xbar = mean(x);
v1 = 0;
for i = 1:n
    v1 = v1 + (x(i) - xbar)^2;
    
end
v1 = v1/n;
    

%formula 2: only one for loop (main difference)
%computer two things: sum 1 and sum 2

s1 = 0;
s2 = 0;

for i = 1:n
    s1 = s1 + x(i)^2;
    s2 = s2 + x(i);
end
v2 = (1/(n-1))* (s1 - (s2^2)/n);

v1
v2
 

%two mathematically equivalent formulas yeild two very different computer
%values.
    
    
    
    




