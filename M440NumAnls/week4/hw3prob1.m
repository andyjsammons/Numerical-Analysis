%homework 3 problem 1:


a = 5e-4;
b = 100;
c = 5e-3;
% 5e-4x^2 + 100x + 5e-3 = 0

%method 1:


x = (-b + sqrt(b^2 - 4*a*c))/2*a


%method 2:


x2 = (2*c)/(-b - sqrt(b^2 - 4*a*c))


%method 2 is more accurate. The inaccuracy in method 1 is due to
%cancellation. the numbers b and sqrt(b^2 - 4ac) are very similar and when
%subtracted create errors. Whereas, cancellation does not occur in the
%second method.



