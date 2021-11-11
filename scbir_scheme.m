function [secure_index,time_taken,avg_precision]=scbir_scheme(dataset,query_set,num_cluster)
%% Clustering and Indexing
 t_clustering=tic;
 rng('shuffle');
[idx,cluster_centre]=kmeans(dataset,num_cluster);                      % Clusters all the image feature vectors
dim=size(dataset,2);
[M1,M2,S]=Genparam_aspe(dim);                                          % Generates secret parameters for image encryption using ASPE
[M1_dataset,M2_dataset]=feature_encryption_aspe(dataset',M1,M2,S);     % Encrypts all features vectors in dataset using ASPE
secure_index=create_secure_index(idx,cluster_centre,M1,M2,S);        % Creates a secure index comprising cluster center index and corresponding images along with encrypted cluster center vectors
secure_index.M1_dataset=M1_dataset;
secure_index.M2_dataset=M2_dataset;
time_taken(1,1)=toc(t_clustering);
%% Trapdoor generation by the Query user
t_trap=tic;
trapdoor=generate_trapdoor_all_queries(query_set,dataset,M1,M2,S);     % Generates trapdoor (encrypted query vector) for all queries
time_taken(1,2)=toc(t_trap);

%% Search
search=tic;
[img_indices]=search_index(secure_index,trapdoor);                       % Retrieve images in the cluster closest to each encrypted query vector 
num_queries=size(query_set,2);
count_array=zeros(num_queries,5);                           
for i=1:num_queries
    M1_fqa=trapdoor(i).M1_fqa;                                          % Fetch encrypted query feature vector
    M2_fqb=trapdoor(i).M2_fqb;
    
    retrieved_images=img_indices(i).similar_images;                     % Retrieved images for each query
    [M1_retrieved,M2_retrieved]=get_encrypted_features(retrieved_images,M1_dataset,M2_dataset);  % Fetch corresponding encrypted image features
    [d(1,:),ind(1,:),c]=sorted_distance_aspe(M1_retrieved,M2_retrieved,M1_fqa,M2_fqb);     % Compute distance between the encrypted query vector with each of the encrypted feature vector 
    for j=1:size(ind,2)
        index=ind(1,j);
        sorted_imgs(j,1)=retrieved_images(index,1);                     % Sort images according to the distance
    end
    count_array(i,:)=actually_similar(query_set(1,i),sorted_imgs);      % Counts the actually similar images of the query based on the category they belong for top-10,20,30,40, and 50 retrieved results.
    clear ret_images M1_retrieved M2_retrieved d ind sorted_imgs;
end
time_taken(1,3)=toc(search);
[precision,avg_precision]=average_precision(count_array);               % Computes average precision-averaged on all queries
