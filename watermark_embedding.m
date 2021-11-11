function embedded_encrypted_image= watermark_embedding(encrypted_image,s,watermark,kemb1,kemb2,Nw)      %   Embeds watermark in encrypted image using secret embedding keys kemb1 and kemb2 
    [image_blocks,num_blocks]=divide_to_blocks(encrypted_image,s);          %   Divide encrypted image into non-overlapping blocks of size s
    chosen_blocks=choose_blocks(kemb1,encrypted_image,s,Nw);                %	Choose Nw blocks from image blocks using secret key, kemb1 
    embedded_encrypted_image=encrypted_image;
    for wi=1:Nw         %   For each chosen block
        block_r=chosen_blocks(wi,1);
        block_c=chosen_blocks(wi,2);
        [s0,s1]=split_block(kemb2,s);                                       %   Split each chosen block into S0 and S1 using kemb2   
        embedded_image_block=embed_watermark(watermark(wi),image_blocks{block_r, block_c},s0,s1);   %   Embed watermark to each chosen block
        embedded_encrypted_image=add_blocks_to_image(embedded_encrypted_image,embedded_image_block,block_r,block_c,s);      %   Append embedded image blocks to the encrypted image
       clear s0 s1;
    end
end