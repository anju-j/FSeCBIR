function [M1_fia,M2_fib]=feature_encryption_aspe(dataset,M1,M2,S)  % Uses modified tuple encryption in ASPE and returns encrypted feature vector
    for j=1:size(dataset,2)
        f=dataset(:,j);
        norm_f=norm(f);
        norm_f=norm_f*norm_f;
        f=vertcat(f,norm_f);        % Append square of norm(f)to the end of feature vector
        for i=1:size(S,2)           % Split f into two-fia and fib based on S. If S(i)==0, assign f_value to fia and fib. 
                                    %If S(i)==1, assign two random values a and b such that a+b=f_value to fia and fib
            f_value=f(i);
            if S(i)==0 || f_value==0     
                fia(i,1)=f_value;
                fib(i,1)=f_value;
            else
                if f_value<0
                    a=randi(ceil(abs(f_value)),1,1);  
                    b=f_value-a;
                else
                    a=randi(ceil(abs(f_value)),1,1);  
                    b=f_value-a;
                end
               fia(i,1)=a;
               fib(i,1)=b;
            end
        end
       
            M1_fia(:,j)=mtimes(M1',fia(:,1));       %   Multiplying secret parameter M1 to generate encrypted fia
            M2_fib(:,j)=mtimes(M2',fib(:,1));       %   Multiplying secret parameter M2 to generate encrypted fib
            clear fia fib;
    end
end
