function image_block=embed_watermark(watermark_bit,image_block,s0,s1)       %   Embeds watermark bits in the image block
if watermark_bit==0               
	for k1=1:size(s0,1)
        pix=image_block(s0(k1,1),s0(k1,2));                 %   If watermark bit is 0, flip last two bits of pixels in S0
        pix_binary=de2bi(pix,8);
        pix_binary(1,1)=not(pix_binary(1,1));   
        pix_binary(1,2)=not(pix_binary(1,2));
        image_block(s0(k1,1),s0(k1,2))=bi2de(pix_binary);
        clear pix pix_binary;
	end
else
	for k1=1:size(s1,1)
        pix=image_block(s1(k1,1),s1(k1,2));                  %   If watermark bit is 1, flip last two bits of pixels in S1
        pix_binary=de2bi(pix,8);
        pix_binary(1,1)=not(pix_binary(1,1));
        pix_binary(1,2)=not(pix_binary(1,2));
        image_block(s1(k1,1),s1(k1,2))=bi2de(pix_binary);
        clear pix pix_binary;
	end
end