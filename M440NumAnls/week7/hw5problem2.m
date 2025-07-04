%homework 5 problem 2

x = dataset1(:,2);
y = dataset1(:,1);

plot(x,y,'ro')
axis([-3,3,-0.5,2])
hold on

n = 9;
m = length(x);
A = zeros(m,n+1);
for i = 1:n+1
    A(:,i) = x.^(i-1);
end


coeff = A\y;

p = @(x) polyval(flipud(coeff),x);

fplot(p,'b',[-2,2])
axis([-3,3,-0.5,2])



