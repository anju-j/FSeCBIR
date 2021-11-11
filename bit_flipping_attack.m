function [bitflip_accuracy]=bit_flipping_attack(decrypted_img,original_image,s,Nw,kemb1,kemb2,watermark)
        prop_val=[10,15,20,25,30,35,40,45,50];              %   Bit-flipping proportions (%)
        accuracy=zeros(1,1);
        bitflip_accuracy=zeros(1,9);
        
        img_row=size(decrypted_img,1);
        img_col=size(decrypted_img,2);
        dim=size(decrypted_img,3);
        attacked_image=zeros(img_row,img_col,dim);
        for p=1:size(prop_val,2)
            for d=1:dim 
                decrypted_img=decrypted_img(:,:,d);
                [decrypted_image_blocks,num_blocks]=divide_to_blocks(decrypted_img,s);      %   Divide decrypted image into blocks
                for b1=1:size(decrypted_image_blocks,1)
                        for b2=1:size(decrypted_image_blocks,2)
                            attacked_image_block=bit_flipping_attack_blockwise(decrypted_image_blocks{b1,b2},prop_val(1,p));    %   Perform bit flipping attack per block
                            decrypted_image_blocks{b1,b2}=attacked_image_block;
                        end
                 end
                 embedded_decrypted_image_1=decrypted_img;
                 for b1=1:size(decrypted_image_blocks,1)
                        for b2=1:size(decrypted_image_blocks,2)
                           embedded_decrypted_image_1=add_blocks_to_image(embedded_decrypted_image_1,decrypted_image_blocks{b1,b2},b1,b2,s);
                        end
                  end
                  attacked_image(:,:,d)= embedded_decrypted_image_1;
            end
                    dim_ext=size(decrypted_img,3);
                    final_watermark=zeros(Nw,dim_ext);
                    for d=1:dim 
                        attacked_img=attacked_image(:,:,d);
                        original_img=original_image(:,:,d);
                        [extracted_watermark]= watermark_extraction(attacked_img,original_img,s,Nw,kemb1,kemb2);            %   Extract watermark from bit-flipped image
                        final_watermark(:,d)=extracted_watermark;
                        accuracy(1,d)=extraction_accuracy(watermark,extracted_watermark);                                   %   Compute watermark extraction accuracy
                   end
                   bitflip_accuracy(1,p)=floor(accuracy);                 
        end
        