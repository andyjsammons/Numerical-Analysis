n = 20;
x = randn(n,1);

c = ones(n,1);  %polynomial coefficents
y = polyval(c,x) % irl we are not given c


A = x.^(0:n-1);

c_omputed = A\y

plot(x,y,'x','MarkerSize',50);
hold on
poly = @(x) polyval(c,x);
poly_computed = @(x) polyval(c_omputed,x);

fplot(poly,'r')
fplot(poly_computed,'b')

axis([-1,1,-20,20])













