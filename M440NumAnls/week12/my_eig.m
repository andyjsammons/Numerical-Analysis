function eig_values = my_eig(A)
%my_eig: computes the eigenvalues of a real upper Hessenberg matrix A
[m,n] = size(A);
n = m;
%reduce A to upper Hessenberg form
H = hess(A);

%qr iteration of degree 2

break_matrix = 0;

if n==1
    eig_values(1) = H(1,1);
elseif n == 2 
    eig_values(1:2) = roots([1,-trace(H(1:2,1:2)), det(H(1:2,1:2))]);
else

    while break_matrix == 0
        
        %eigvalues = zeros(n,1); 
        

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

    
        for i = 1:n-1
            if abs(H(i+1,i))<1e-15*(abs(H(i,i))+abs(H(i+1,i+1)))
                break_matrix = 1;
                
                break
            end
        end
    end
    eig_values(1:i,1) = my_eig(H(1:i,1:i));
    eig_values(i+1:n,1) = my_eig(H(i+1:n,i+1:n));
    
end
        
  
        
        
%top twelve eigenvalues:
%   0.0000 + 1.7007i
%   0.0000 - 1.7007i
%   0.1081 + 0.0541i
%   0.1081 - 0.0541i
%  -0.0072 + 0.1207i
%  -0.0072 - 0.1207i
%  -0.1009 + 0.0666i
%  -0.1009 - 0.0666i
%   0.0598 + 0.0437i
%   0.0598 - 0.0437i
%  -0.0747 + 0.0000i
%   0.0746 + 0.0000i

















