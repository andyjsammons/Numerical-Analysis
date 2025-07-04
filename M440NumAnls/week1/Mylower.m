%improving an alg. lower triangular systems

%(a) l_ii = 0
%(b) one for-loop
%(c) store x over b


function b = lower(L,b)
%inputs: lower triangular matrix L, and a vector b
%outputs: solution to LX = b
%row oriented forward substitution (it accesses L by rows)


[n,m] = size(L);

if n~=m
    disp('error: this is an error')
end



for i = 1:n

    if L(i,i) == 0
        disp('error: this is another error')
        return
    end
    
    
    b(i) = b(i) - L(i,1:i-1) * b(1:i-1);
    b(i) = b(i)/L(i,i);
    
end


end






