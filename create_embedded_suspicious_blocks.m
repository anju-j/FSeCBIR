function [image_block_0,image_block_1]=create_embedded_suspicious_blocks(suspicious_block,s0,s1)
    image_block_0=embed_watermark(0,suspicious_block,s0,s1);     %   Embed watermark bit, 0 to the suspicious block
    image_block_1=embed_watermark(1,suspicious_block,s0,s1);     %   Embed watermark bit, 1 to the suspicious block   
end