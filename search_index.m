function [img_indices]=search_index(secure_index,trapdoor)                      %   Search the secure index to determine th similar images of the trapdoor
img_indices=struct([]);
num_queries=size(trapdoor,2);
table=secure_index.table;
M1_fia=secure_index.M1_cc;
M2_fib= secure_index.M2_cc;
for q=1:num_queries                                                             %   Compute distance of each query with all cluster centres to find closest cluster centre
    M1_fqa=trapdoor(q).M1_fqa;      
    M2_fqb=trapdoor(q).M2_fqb;
    [d(q,:),ind(q,:),c]=sorted_distance_aspe(M1_fia,M2_fib,M1_fqa,M2_fqb);      %   Determine the closest cluster centre of each encrypted query vectors
    closest_cluster=ind(q,1);          
    img_indices(q).similar_images=table(closest_cluster).images;                %   Fetch the images in closest cluster from table for each query which 
    clear M1_fqa M2_fqb;                                                        %   are considered similar to the query image.
end

