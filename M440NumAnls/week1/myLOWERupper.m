function [L,U] = myLOWERupper(A)

%computes LU factorization of A


[m,n] = size(A); %gize dimesions of A

if n ~= m
    disp('Error: youve made an error, hotshot')
    return
end

%final checks
if A(n,n) == 0
    disp('warning: matrix is singular')
end


%so I have my matrix A = []. 
%step 1: create zeros on lower left side using multipliers generated
%from pivot values:

L = eye(n);

for i = 1:n-1
    if A(i,i) == 0
        disp('error, another error')
        return
    end
    for j = i+1:n
        L(j,i) = A(j,i)/A(i,i); %multiplier
        A(j,i) = 0;
        A(j,i+1:n) = A(j,i+1:n) - L(j,i)* A(i,i+1:n);
        %for k = i+1:n
        %    A(j,k) = A(j,k) - L(j,i)*A(i,k);
        %end
    end
end

U = A;
        
        
        
        
        


                    