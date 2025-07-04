%qr iteration of degree 2


load  west0479;
H = hess(full(west0479));
[n,m] = size(A);


eigvalues = zeros(n,1);
while n>2
    %create the bulge
    d = H(n,n)*H(n-1,n-1)-H(n,n-1)*H(n-1,n); %sigma_1*sigma_2
    t = H(n,n) + H(n-1,n-1); %sigma_1+sigma_2
    
    a = H(1,1)^2+H(1,2)*H(2,1)-t*H(1,1)+d;
    b = H(2,1)*H(1,1)+H(2,1)*H(2,2)-H(2,1)*t;
    c = H(2,1)*H(3,2);
    %reflector I - gamma*x*x'
    x = [a;b;c];
    tau = sign(a)*norm(x);
    gamma = (x(1)+tau)/tau;
    x(2:3) = x(2:3)/(x(1)+tau);
    x(1) = 1;
    %apply reflector from the left
    H(1:3,:) = H(1:3,:)-(gamma*x)*(x'*H(1:3,:));
    %apply reflector from the right
    H(:,1:3) = H(:,1:3)-(H(:,1:3)*x)*(gamma*x)';
    %returning H to upper Hessenberg form
    for j=1:n-2
        if H(j+1,j) <= 1e-15*(abs(H(j,j) + abs(H(j+1,j+1))))
            H(j+1,j) = 0;
            j = j + 2;
        end
        if j<n-2
            %reflector I - gamma*x*x'
            x = H(j+1:j+3,j);
            tau = sign(x(1))*norm(x);
            gamma = (x(1)+tau)/tau;
            x(2:3) = x(2:3)/(x(1)+tau);
            x(1) = 1;
            %apply the reflector
            H(j+1:j+3,:) = H(j+1:j+3,:)-(gamma*x)*(x'*H(j+1:j+3,:));
            H(:,j+1:j+3) = H(:,j+1:j+3)-(H(:,j+1:j+3)*x)*(gamma*x)';
        else
            %rotator 
            x = H(n-1:n,n-2);
            c = x(1)'/norm(x);
            s = x(2)'/norm(x);
            %apply the rotator
            H(n-1:n,:) = [c s;-s' c']*H(n-1:n,:);
            H(:,n-1:n) = H(:,n-1:n)*[c s;-s' c']';
        end
    end
    %checking for convergence
    if abs(H(n,n-1))<1e-15*(abs(H(n,n))+abs(H(n-1,n-1)))
        eigvalues(n) = H(n,n);
        n = n-1;
    elseif abs(H(n-1,n-2))<1e-15*(abs(H(n-1,n-1))+abs(H(n-2,n-2)))
        eigvalues(n-1:n) = roots([1,-trace(H(n-1:n,n-1:n)),det(H(n-1:n,n-1:n))]);
        n = n-2;
    end
end
if n==1
    eigvalues(1) = H(1,1);
else %n==2
    eigvalues(1:2) = roots([1,-trace(H(1:2,1:2)), det(H(1:2,1:2))]);
end

%[sort(eig(A)) sort(eigvalues)];
        
        
        
        
        
        

    