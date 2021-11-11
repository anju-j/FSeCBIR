function delta=calculate_delta(suspicious_block,original_block)     %   Difference between original and suspicious block
delta=0;
m=size(suspicious_block,1);
n=size(suspicious_block,2);
for i=1:m
	for j=1:n
        flag=0;
        p1=suspicious_block(i,j);
        p2=original_block(i,j);
        p1_binary=de2bi(p1,8);
        p2_binary=de2bi(p2,8);
        pi=3;
        for k=1:6                               
            if p1_binary(1,pi)~=p2_binary(1,pi)         %   If six MSBs of pixels of suspicious block and original block differ set flag else flag is not set.
                flag=1;
            end
            pi=pi+1;
        end
            if flag==0                                  %   If flag is not set, it means six MSBs of pixels of suspicious block and original block are same. 
                delta=delta+(double(suspicious_block(i,j))-double(original_block(i,j)))^2;      %   Compute delta
            end
     end
end
end