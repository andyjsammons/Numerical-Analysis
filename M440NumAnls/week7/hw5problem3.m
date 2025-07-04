%hw 5 problem 3

x = dataset2(:,1);
y = dataset2(:,2);

plot(x,y,'o')
hold on


d = 3;
n = length(x);

% for i = 1:d+1
%     A(:,i) = x.^2 + (y.^1)*(x.^1) + y.^2 + x.^1 + y.^1;
% end
A = [x.^2 x.*y y.^2 x y];
b = ones(n,1);
coeff = A\b;

fimplicit(@(x,y) coeff(1)*x.^2 + coeff(2)*x.*y + coeff(3)*y.^2 + coeff(4)*x + coeff(5)*y -1)

