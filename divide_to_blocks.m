function [image_blocks,num_blocks]=divide_to_blocks(I,s)   %   Divide image into non-overlapping blocks of size s
    img_row=size(I,1);
    img_col=size(I,2);
    num_blocks=floor(img_row/s)*floor(img_col/s);
    image_blocks=mat2cell(I(1:floor(img_row/s)*s,1:floor(img_col/s)*s),ones(1,floor(img_row/s))*s,ones(1,floor(img_col/s))*s);
end
