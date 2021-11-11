function [M1_retrieved,M2_retrieved]=get_encrypted_features(ret_images,M1_dataset,M2_dataset)   % Fetch encrypted feature vectors of the retrieved images
    dim_M=size(M1_dataset,1);
    num_imgs=size(ret_images,1);
    M1_retrieved=zeros(dim_M,num_imgs);
    M2_retrieved=zeros(dim_M,num_imgs);
    for i=1:num_imgs
        ind=ret_images(i,1);
        M1_retrieved(:,i)=M1_dataset(:,ind);
        M2_retrieved(:,i)=M2_dataset(:,ind);
    end
end
