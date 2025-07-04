
load west0479;
A = west0479;
x = randn(length(A(:,1)),1);
shift = 6;
k = 200;
[Q,H] = shift_and_invert_Arnoldi(A,x,shift,k);
residuals = ones(10,1);
if max(residuals) > 9e-16
    display('need more k')
end

ritz_values = eig(H(1:end-1,1:end));
ritz_values = sort(ritz_values,'descend','ComparisonMethod','abs');
ritz_values = shift+1./ritz_values;

eig_values = eig(full(A));
eig_values = sort(eig_values,'descend','ComparisonMethod','abs');

eigs = ones(10,1);
for i = 1:10
    [e,index] = min(abs(ritz_values(i) - eig_values));
    eigs(i) = eig_values(index);
end


[eigs ritz_values(1:10)]

%for k = 200, the ritz_values are identical to the 'true' eigenvalues.

%ans =

%   5.8229 + 0.0000i   5.8229 + 0.0000i
%   5.4060 + 0.0000i   5.4060 + 0.0000i
%   6.7386 + 0.0000i   6.7386 + 0.0000i
%   7.0740 + 0.0000i   7.0740 + 0.0000i
%   4.7459 + 0.0000i   4.7459 + 0.0000i
%   4.3290 - 1.0151i   4.3290 - 1.0151i
%   4.3290 + 1.0151i   4.3290 + 1.0151i
%   3.9852 + 0.0000i   3.9852 + 0.0000i
%   6.4450 - 2.4045i   6.4450 - 2.4045i
%   6.4450 + 2.4045i   6.4450 + 2.4045i




