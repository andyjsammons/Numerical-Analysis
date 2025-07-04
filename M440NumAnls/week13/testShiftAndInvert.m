%Testing shift and invert Arnoldi
% Testing Arnoldi

%we need a large and sparse matrix
G = numgrid('N',40);
A = delsq(G);
A = sprandn(A)+sqrt(-1)*sprandn(A);

% We want to compute the 10 nearest eigenvalues to shift
shift = 6+sqrt(-1)*0;
%sift and invert Arnoldi
n = size(A,1);
x = randn(n,1);
k = 50;
[Q,H] = shift_and_invert_Arnoldi(A,x,shift,k);

%Ritz values
ritz_values = eig(H(1:end-1,1:end));
ritz_values = sort(ritz_values,'descend','ComparisonMethod','abs');
ritz_values = shift+1./ritz_values;

eig_values = eig(full(A));
plot(real(maxk(eig_values,10)),imag(maxk(eig_values,10)),'rx')
hold on
plot(real(ritz_values(1:10)), imag(ritz_values(1:10)),'bo')

[maxk(eig_values,10), ritz_values(1:10)]



