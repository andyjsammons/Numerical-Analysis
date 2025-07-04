function A = my_hess(A)
%my_hess reduced matrix A into upper hessenberg form


n = size(A,2); %the number of columns

for j = 1:n-1 %iterate over columns of A
    %reflector I - gamma*u*u'
    x = A(j + 1:n,j);
    norm_x = norm(x);
    if norm_x == 0
        gamma = 0;
    else
        tau = sign(x(1)) * norm_x;
        x(1) = x(1) + tau;
        gamma = x(1)/tau;
        x(1:n-j) = x(1:n-j)/x(1); %vector u
    end
    %apply the reflector to A
    A(j + 1:n,:) = A(j+1:n,:)-(gamma*x)*(x'*A(j+1:n,:));
    %preserve eigenvalues, so multiply on the right by the vector transpose
    A(:,j+1:n) = A(:,j+1:n) - (A(:,j+1:end)*x)*(gamma*x)';
    
end


    
    
    
    
    







