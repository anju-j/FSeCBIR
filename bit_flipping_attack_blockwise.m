function embedded_decrypted_image=bit_flipping_attack_blockwise(embedded_decrypted_image,prop)
    total_pixels=size(embedded_decrypted_image,1)*size(embedded_decrypted_image,2);     %   Compute total number of pixels
    num_pixels_to_flip=floor((prop*total_pixels)/100);          %   Number of pixels to be flipped per block based on proportion
    pixel_positions=randperm(total_pixels,num_pixels_to_flip);  %   Find random positions to flip
    for i=1:size(pixel_positions,2)
            row=ceil(pixel_positions(1,i)/size(embedded_decrypted_image,2));
            col=pixel_positions(1,i)-(floor(pixel_positions(1,i)/size(embedded_decrypted_image,2))*size(embedded_decrypted_image,2));
            if(row==0)
                row=1;
            end
            if col==0
                col=1;
            end
            pix=embedded_decrypted_image(row,col);
            pix_binary=de2bi(pix,8);
            pix_binary(1,1)=not(pix_binary(1,1));               %   2 LSBs are flipped
            pix_binary(1,2)=not(pix_binary(1,2));
            embedded_decrypted_image(row,col)=bi2de(pix_binary);%   Add flipped pixels to the image
            clear pix pix_binary;
    end
end