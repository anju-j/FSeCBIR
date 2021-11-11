function [d,ind,c]=sorted_distance_aspe(M1_fia,M2_fib,M1_fqa,M2_fqb)    %   Compute distance between encrypted feature vector and the encrypted query vector
for j=1:size(M1_fqa,2)                                                  %   Multiplying each encrypted feature vector with the encrypted query vector
    for i=1:size(M1_fia,2)
        d(i,j)=M1_fqa(:,j)'*M1_fia(:,i) + M2_fqb(:,j)'*M2_fib(:,i);     %   Distance between them isstored in variable d
    end
    [c,ind]=sort(d);                                                    %   Sort the resulting distance and return sorted indices along with corresponding distance                                        
end
end
