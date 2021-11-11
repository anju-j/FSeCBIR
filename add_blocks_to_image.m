function img=add_blocks_to_image(img,block,row,col,s)       %   Add block to img. s is block size
    start_row=(row-1)*s;
    start_col=(col-1)*s;
    p=1;
    for i=start_row+1:start_row+s
        q=1;
        for j=start_col+1:start_col+s
           img(i,j)= block(p,q);        %   Replace the original image block with new block
           q=q+1;
        end
        p=p+1;
    end
end