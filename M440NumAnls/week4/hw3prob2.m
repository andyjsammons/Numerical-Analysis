snew = 0;
x = -5.5;
i = 0;
power = 1;
s = 1;

while abs(snew - s)/abs(s) > 10^(-10)
    s = snew;
    snew = chop(s + chop(power/factorial(i),10),10);
    i = i + 1;
    power = chop(power*x,10);
end

rel_error = abs(exp(-5.5) - snew)/abs(exp(-5.5))
snew
exp(-5.5)

%A better way to calculate e^-5.5 . The actual
%solution to exp(-5.5) is 0.00408677, whereas the computed value is 0.0041.
%The computed value is rounded with a relatively high degree of error.


