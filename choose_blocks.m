function chosen_blocks=choose_blocks(kemb1,encrypted_image,s,Nw)        %   Choose Nw blocks using secret key kemb1         
	img_row=size(encrypted_image,1);
    img_col=size(encrypted_image,2);
	chosen_blocks=zeros(Nw,2);
    rng(kemb1);                 
    g=1;
    while g<=Nw
        b1=randi(floor(img_row/s),1,1);             %   Random block numbers (b1 and b2) are generated using seed- kemb1
        b2=randi(floor(img_col/s),1,1);
        [o,pos]=ismember(chosen_blocks,[b1 b2],'rows');     
        if o==0                                     %   Select unique blocks
            chosen_blocks(g,1)=b1;
            chosen_blocks(g,2)=b2;
            g=g+1;
        end   
    end         
        