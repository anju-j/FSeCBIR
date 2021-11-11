function [secure_index]=create_secure_index(idx,cluster_centre,M1,M2,S)   %     Creates secure index
 %   Inputs: idx has index of cluster to which each image belong, cluster
 %   centre feature vector and secret parameters for feature encryption using ASPE 
    secure_index=struct();
    table=struct([]);
    n_cluster=size(cluster_centre,1);
    for i=1:n_cluster
        [imgs,b]=find(idx(:,1)==i);
        table(i).images=int16(imgs);       %     Table comprising Cluster center index and corresponding images
        table(i).cc_index=int8(i);            
    end
        [M1_cc,M2_cc]=feature_encryption_aspe(cluster_centre',M1,M2,S);     %	Encrypt each cluster centre using ASPE
        %%   Encrypted cluster centers stored in a struct() along with table
        secure_index.M1_cc=M1_cc;                                           
        secure_index.M2_cc=M2_cc;            
        secure_index.table=table;                                           
end
