function  [bitflip_accuracy,jpeg_comp_accuracy,result_without_attack]=watermark_main(image_id,I,watermark)
k_i=100;                                                                        %   Image encryption key
kimg=bitxor(image_id,k_i);                                                      %   Distinct key for each image. Any standard encryption schemes can be used for generating kimg.
input=[16 24 32];                                                               %   Each row represent number of watermark bits and block size
Nw=size(watermark,2);                                                           %   Size of watermark
jpeg_comp_accuracy=zeros(3,9);
bitflip_accuracy=zeros(3,9);
result_without_attack=zeros(3,4);
% Image sizes
img_row=size(I,1);              
img_col=size(I,2);
dim=size(I,3);                          

for j=1:size(input,2)
    %tic;
    s=input(1,j);                                                               %  s is Block size 
    encrypted_image=zeros(img_row,img_col,dim,'uint8');
    streamkey=streamkey_gen(kimg,img_row,img_col);                              %   Generates stream key for image encryption
    for d=1:dim 
        original_image=I(:,:,d);
        encrypted_image1=image_encryption(streamkey,original_image);            %   Image encryption using stream key
        encrypted_image(:,:,d)=encrypted_image1;
    end
    %filename1=strcat('./results/',num2str(image_id),'_',num2str(s),'.tif');    %   Save encrypted image
    %imwrite(encrypted_image,filename1);
    %% Watermark embedding
    kemb1=100;                                                                  %   Secret key for choosing blocks to which watermarks are to be embedded 
    kemb2=33;                                                                   %   Secret key for splitting each block into S0 and S1
    embedded_encrypted_image=uint8(zeros(img_row,img_col,dim));
    embed_t=tic;
    for d=1:1 
        enc_img=encrypted_image(:,:,d);           
        embedded_encrypted_image= watermark_embedding(enc_img,s,watermark,kemb1,kemb2,Nw); %   Embed watermark in encrypted image
        embedded_encrypted_image(:,:,d)=embedded_encrypted_image;
    end
    embedding_time=toc(embed_t);

    %% Decryption of images with watermark
    img_row_e=size(encrypted_image,1);
    img_col_e=size(encrypted_image,2);
    decrypted_image=zeros(img_row,img_col,dim,'uint8');
    streamkey_e=streamkey_gen(kimg,img_row_e,img_col_e);                    %   Generates stream key for image decryption
    for d=1:dim 
    	enc_img=embedded_encrypted_image(:,:,d);
    	decrypted_image1 = image_decryption(streamkey_e,enc_img);           %   Decrypts image with watermarks
    	decrypted_image(:,:,d)=decrypted_image1;
    end
    ssim_value = ssim(uint8(decrypted_image),I);                            %   SSIM of decrypted image compared with original image
    psnr_value = psnr(uint8(decrypted_image),I);                            %   PSNR of decrypted image compared with original image
    %% Watermark extraction from decrypted image  and original image
    dim_ext=size(decrypted_image,3);
    final_watermark=zeros(Nw,dim_ext);
    for d=1:dim 
    	emb_dec_img=decrypted_image(:,:,d);
    	original_img=I(:,:,d);
    	extracted_watermark= watermark_extraction(emb_dec_img,original_img,s,Nw,kemb1,kemb2);   %   Extracts watermark from decrypted image using original image and secret embedding keys 
    	final_watermark(:,d)=extracted_watermark;
    	accuracy_without_attack(1,d)=extraction_accuracy(watermark,extracted_watermark);        %   Compute accuracy of the extracted watermark compared with original watermark 
    end
    result_without_attack(j,1)=psnr_value;
    result_without_attack(j,2)=ssim_value;
    result_without_attack(j,3)=embedding_time;
    result_without_attack(j,4)= accuracy_without_attack;

    %% JPEG compression attack
    [jpeg_comp_accuracy(j,:),]=jpeg_compression_attack(j,decrypted_image,watermark,I,s,Nw,kemb1,kemb2);         %   Simulate JPEG compression attack on decrypted image
    %% Bit flipping attack
    [bitflip_accuracy(j,:)]=bit_flipping_attack(decrypted_image,I,s,Nw,kemb1,kemb2,watermark);                  %   Simulate Bit-flipping attack on decrypted image
    %fprintf('\nAttack simulation in block size %d finished\n',s);
   %toc;
end
end
