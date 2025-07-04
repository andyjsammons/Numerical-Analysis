function [L,U,p] = myLupper(A)

%input is matrix A

%finds the LU factorization of A by using GEPP

[m,n] = size(A);
if m~=n 
    disp('Error: we are not happy because we do not have a square matrix')
    return
end

p = 1:n; % permutation
for i = 1:n-1
    %with partial pivoting we need to first find the largest entry in a
    %column
    [maxA,pos] = max(abs(A(i:n,i))); %get max val and row position
    if maxA == 0
        disp('error: the matrix is singular')
        return
    end
    row2swap = i + pos - 1; %swap this row
    %this is how i do this in matlap:
    A([i,row2swap],:) = A([row2swap,i],:);
    %now keep track of permutation:
    p([i,row2swap]) = p([row2swap,i]);
    %now create zeros below new pivot entry
    for j = i+1:n
        %first compute multiplier:
        A(j,i) = A(j,i)/A(i,i);
        A(j,i+1:n) = A(j,i+1:n) - A(j,i)*A(i,i+1:n);
    end
end

%after doing gaussian elimination we have something like A = [mult\U]
L = tril(A,-1) + eye(n); %graph the lower triangular portion minues the terms in diagonal plus ones in diagonal.
U = triu(A); %extract the upper triangular part of A
    
    
    
    
    
    
    