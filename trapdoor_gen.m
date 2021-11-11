function [M1_fqa,M2_fqb]=trapdoor_gen(fq,M1_inv,M2_inv,S,gamma) %   Generate trapdoor per query vector
fq=fq';
fq=-2*fq;                                                       %   Multiply the query vector with (-2)
fq=horzcat(fq,1);                                               %   Append a 1 to the end of the vector
        for i=1:size(S,2)
            f_value=fq(i);
            if S(i)==1 || f_value==0                            %  Split fq into two-fqa and fqb based on S. If S(i)==1, assign f_value to fqa and fqb 
                                                                %   If S(i)==0, assign two random values a and b such that a+b=f_value to fqa and fqb
                fqa(i,1)=f_value;
                fqb(i,1)=f_value;
            else
              if f_value<0
                    a=randi(ceil(abs(f_value)),1,1);  
                    b=f_value-a;
                else
                    a=randi(ceil(abs(f_value)),1,1);  
                    b=f_value-a;
              end
               fqa(i,1)=a;
               fqb(i,1)=b;
            end
        end
            M1_fqa=M1_inv*fqa;                                  %   Multiplying inverse of secret parameter M1 to generate encrypted fqa
            M1_fqa=gamma*M1_fqa;                                %   For randomness, multiply with gamma, a random positive integer specific to each query.
            M2_fqb=M2_inv*fqb;                                  %   Multiplying inverse of secret parameter M1 to generate encrypted fqa
            M2_fqb=gamma* M2_fqb;                               %   For randomness, multiply with gamma, a random positive integer specific to each query.
end
