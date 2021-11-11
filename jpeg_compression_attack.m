function [accuracy]=jpeg_compression_attack(j,embedded_decrypted_image, original_wm,original_image,s,Nw,kemb1,kemb2)    %   Similate JPEG compression attack on watermark embedded decrypted image
    qualityFactor =  60:5:100;                      
    accuracy1=zeros(1,1);
    accuracy=zeros(1,9);
    mkdir('./results/intermediate_jpeg');
    file_comp=strcat('./results/intermediate_jpeg/jpg',num2str(j),'.jpg');    
    for i = 1:size(qualityFactor,2)
        imwrite(embedded_decrypted_image,file_comp,'jpg','quality',qualityFactor(1,i));     %   Write compressed images at different quality factors
        compressed_image=imread(file_comp);
        dim_ext=size(compressed_image,3);
        final_watermark=zeros(Nw,dim_ext);
        for d=1:dim_ext 
            img=compressed_image(:,:,d);
            original_img=original_image(:,:,d);
        	extracted_watermark= watermark_extraction(img,original_img,s,Nw,kemb1,kemb2);   %   Extract watermark from compressed image
            final_watermark(:,d)=extracted_watermark;
            accuracy1(1,d)=extraction_accuracy(original_wm,extracted_watermark);            %   Compute watermark extraction accuracy
       end
        accuracy(1,i) = floor(accuracy1);                                                   % Store extraction accuracies at different quality factors
        clear compressed_image;
    end
    rmdir('./results/intermediate_jpeg','s');
 end
