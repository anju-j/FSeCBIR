function extracted_wm= watermark_extraction(suspicious_image,original_image,s,Nw,kemb1,kemb2)       %   Extracts watermarks from suspicious image using original image and secret keys
    [susp_image_blocks,num_blocks]=divide_to_blocks(suspicious_image,s);       %	Divide suspicious image into non-overlapping blocks of size s
    chosen_blocks=choose_blocks(kemb1,suspicious_image,s,Nw);                  %    Choose Nw blocks from image blocks using secret key, kemb1 
    embedded_susp_image_blocks=susp_image_blocks;
    [original_image_blocks,num_blocks_org]=divide_to_blocks(original_image,s); %	Divide original image into non-overlapping blocks of size s
    extracted_wm=zeros(1,Nw);
    for wi=1:Nw %for each block
        block_r=chosen_blocks(wi,1);
        block_c=chosen_blocks(wi,2);
        [s0,s1]=split_block(kemb2,s);        %   Split each chosen block in suspicious image into S0 and S1 using kemb2 
        [embedded_suspicious_block_0,embedded_suspicious_block_1]=create_embedded_suspicious_blocks(embedded_susp_image_blocks{block_r,block_c},s0,s1);      %   Create two new blocks embedded with watermark bit 0 and 1 resp.
        delta_0=calculate_delta(embedded_suspicious_block_0,original_image_blocks{block_r,block_c});        %  Calculate the difference between suspicious block (embedded with 0) and original data block
        delta_1=calculate_delta(embedded_suspicious_block_1,original_image_blocks{block_r,block_c});        %  Calculate the difference between suspicious block (embedded with 1) and original data block   
        if delta_0<delta_1
            extracted_wm(1,wi)=0;       
        else
            extracted_wm(1,wi)=1;
        end
         clear s0 s1;  
    end
end